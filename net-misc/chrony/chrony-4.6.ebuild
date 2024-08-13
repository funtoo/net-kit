# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit edo tmpfiles toolchain-funcs user

DESCRIPTION="NTP client and server programs"
HOMEPAGE="https://chrony-project.org/"

SRC_URI="https://github.com/mlichvar/chrony/tarball/43189651b05f3dda954569c981983a849c4170d8 -> chrony-4.6-4318965.tar.gz"

KEYWORDS="*"

S="${WORKDIR}/${P/_/-}"

LICENSE="GPL-2"
SLOT="0"
IUSE="+caps +cmdmon debug doc html libedit libtomcrypt +nettle nss +ntp +nts +phc pps +readline +refclock +rtc samba +seccomp +sechash selinux"
# nettle > nss > libtomcrypt in configure
REQUIRED_USE="
	html? ( doc )
	sechash? ( || ( nettle nss libtomcrypt ) )
	nettle? ( !nss )
	nss? ( !nettle )
	libtomcrypt? ( !nettle !nss )
	!sechash? ( !nss )
	!sechash? ( !nts? ( !nettle ) )
"

DEPEND="
	caps? (
		sys-libs/libcap
	)
	libtomcrypt? ( dev-libs/libtomcrypt:= )
	nettle? ( dev-libs/nettle:= )
	nss? ( dev-libs/nss:= )
	nts? ( net-libs/gnutls:= )
	pps? ( net-misc/pps-tools )
	readline? ( dev-libs/libedit )
	seccomp? ( sys-libs/libseccomp )
"
RDEPEND="
	${DEPEND}
	selinux? ( sec-policy/selinux-chronyd )
"
BDEPEND="
	doc? ( app-text/asciidoctor )
	nts? ( virtual/pkgconfig )
	sechash? (
		nettle? ( virtual/pkgconfig )
		nss? ( virtual/pkgconfig )
	)
"
PATCHES=(
	"${FILESDIR}"/"${PN}-4.5-no-installing-docs.patch"
)

S="${WORKDIR}/mlichvar-chrony-4318965"

pkg_setup() {
	if use caps; then
		# ensure the ntp user and group exist
		if ! egetent group ntp > /dev/null; then
			enewgroup ntp > /dev/null
		fi
		if ! egetent passwd ntp > /dev/null; then
			enewuser ntp -1 -1 /dev/null ntp > /dev/null
			elog "Created new user ntp."
		fi
	fi
}

src_prepare() {
	default

	sed -i \
		-e 's:/etc/chrony\.conf:/etc/chrony/chrony.conf:g' \
		doc/* examples/* || die

	cp "${FILESDIR}"/chronyd.conf-r3 "${T}"/chronyd.conf || die
}

src_configure() {
	if ! use caps ; then
		sed -i \
			-e 's/ -u ntp//' \
			"${T}"/chronyd.conf examples/chronyd.service || die
	fi

	if ! use seccomp ; then
		sed -i \
			-e 's/ -F 2//' \
			"${T}"/chronyd.conf examples/chronyd.service || die
	fi

	tc-export CC PKG_CONFIG

	# Update from time to time with output from "date +%s"
	# on a system that is time-synced.
	export SOURCE_DATE_EPOCH=1607976314

	# Not an autotools generated script
	local myconf=(
		$(use_enable seccomp scfilter)
		$(usex caps '' '--disable-linuxcaps')
		$(usex cmdmon '' '--disable-cmdmon')
		$(usex debug '--enable-debug' '')
		$(usex libedit '' '--without-editline')
		$(usex libtomcrypt '' '--without-tomcrypt')
		$(usex nettle '' '--without-nettle')
		$(usex nss '' '--without-nss')
		$(usex ntp '' '--disable-ntp')
		$(usex nts '' '--disable-nts')
		$(usex nts '' '--without-gnutls')
		$(usex phc '' '--disable-phc')
		$(usex pps '' '--disable-pps')
		$(usex readline '' '--without-editline --disable-readline')
		$(usex refclock '' '--disable-refclock')
		$(usex rtc '' '--disable-rtc')
		$(usex samba '--enable-ntp-signd' '')
		$(usex sechash '' '--disable-sechash')
		--chronysockdir="${EPREFIX}/run/chrony"
		--docdir="${EPREFIX}/usr/share/doc/${PF}"
		--mandir="${EPREFIX}/usr/share/man"
		--prefix="${EPREFIX}/usr"
		--sysconfdir="${EPREFIX}/etc/chrony"
		--with-hwclockfile="${EPREFIX}/etc/adjtime"
		--with-pidfile="${EPREFIX}/run/chrony/chronyd.pid"

		${EXTRA_ECONF}
	)

	# Print the ./configure call
	edo ./configure "${myconf[@]}" || die
}

src_compile() {
	emake all
	if use doc; then
		emake docs
	fi
}

src_install() {
	emake DESTDIR="${D}" install
	if use doc; then
		emake DESTDIR="${D}" -C doc install
	fi

	newinitd "${FILESDIR}"/chronyd.init-r2 chronyd
	newconfd "${T}"/chronyd.conf chronyd

	insinto /etc/${PN}
	newins examples/chrony.conf.example1 chrony.conf

	# Compatibility with other distributions who install to /etc/chrony.conf (bug #835461)
	dosym /etc/chrony/chrony.conf /etc/chrony.conf

	docinto examples
	dodoc examples/*.example*

	newtmpfiles - chronyd.conf <<<"d /run/chrony 0750 $(usex caps 'ntp ntp' 'root root')"

	if use html ; then
		docinto html
		dodoc doc/*.html
	fi

	keepdir /var/{lib,log}/chrony

	if use caps ; then
		# Prepare a directory for the chrony.drift file (a la ntpsec)
		# Ensures the environment is sane on new installs
		# Gentoo bug #711058
		fowners -R ntp:ntp /var/{lib,log}/chrony
		fperms -R 770 /var/lib/chrony
	fi

	insinto /etc/logrotate.d
	newins "${FILESDIR}"/chrony-2.4-r1.logrotate chrony
}

pkg_preinst() {
	HAD_CAPS=0
	HAD_SECCOMP=0
	HAD_PRE_NEW_SECCOMP_LEVEL=0

	# See https://dev.gentoo.org/~zmedico/portage/doc/portage.html#package-ebuild-phases-after-2.1.5
	# in "Ebuild Phases" for an explanation of why we need to save the variable beforehand
	if has_version 'net-misc/chrony[caps]' ; then
		HAD_CAPS=1
	fi

	if has_version 'net-misc/chrony[seccomp]' ; then
		HAD_SECCOMP=1
	fi

	if has_version '>=net-misc/chrony-4.1[seccomp]' ; then
		# This version introduced a new filter level: -F 2
		# It's a limited set of seccomp filters designed to be 'bare minimum'
		HAD_PRE_NEW_SECCOMP_LEVEL=1
	fi
}

pkg_postinst() {
	tmpfiles_process chronyd.conf

	if [[ -n "${REPLACING_VERSIONS}" ]] ; then
		if use caps && ! [[ ${HAD_CAPS} -eq 1 ]] ; then
			# bug #719876
			ewarn "Please adjust permissions on ${EROOT}/var/{lib,log}/chrony to be owned by ntp:ntp"
			ewarn "e.g. chown -R ntp:ntp ${EROOT}/var/{lib,log}/chrony"
			ewarn "This is necessary for chrony to drop privileges"
		elif ! use caps && [[ ${HAD_CAPS} -eq 0 ]] ; then
			ewarn "Please adjust permissions on ${EROOT}/var/{lib,log}/chrony to be owned by root:root"
		fi
	fi

	# See bug #783915 for general discussion on enabling seccomp filtering
	# by default.
	local show_seccomp_enable_msg=0

	# Was seccomp disabled before and now enabled?
	if [[ ${HAD_SECCOMP} -eq 0 ]] && use seccomp ; then
		show_seccomp_enable_msg=1
	fi

	# Are we coming from an old version without the new 'minimal' filter?
	# (-F 2)
	if [[ ${HAD_PRE_NEW_SECCOMP_LEVEL} -eq 0 ]] ; then
		show_seccomp_enable_msg=1
	fi

	if [[ ${show_seccomp_enable_msg} -eq 1 ]] ; then
		elog "To enable seccomp in a stricter mode, please modify:"
		elog "- ${EROOT}/etc/conf.d/chronyd for OpenRC"
		elog "to use -F 1 or -F -1 instead of -F 2 (see man chronyd)"
		elog "By default, we now use -F 2 which is a baseline/minimal filter."
	fi
}

# vim: ts=4 noet syn=ebuild