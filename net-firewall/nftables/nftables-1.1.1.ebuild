# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools linux-info

DESCRIPTION="Linux kernel (3.13+) firewall, NAT and packet mangling tools"
HOMEPAGE="https://netfilter.org/projects/nftables/"
SRC_URI="https://www.netfilter.org/pub/nftables/nftables-1.1.1.tar.xz -> nftables-1.1.1.tar.xz
"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="*"
IUSE="debug +cli doc +gmp json +modern_kernel python xtables"

RDEPEND=">=net-libs/libmnl-1.0.3:0=
	gmp? ( dev-libs/gmp:0= )
	json? ( dev-libs/jansson )
	cli? ( dev-libs/libedit:0= )
	>=net-libs/libnftnl-1.2.6:0="

DEPEND="${RDEPEND}
	>=app-text/docbook2X-0.8.8-r4
	doc? ( >=app-text/dblatex-0.3.7 )
	sys-devel/bison
	sys-devel/flex
	virtual/pkgconfig"

pkg_setup() {
	if kernel_is ge 3 13; then
		if use modern_kernel && kernel_is lt 3 18; then
			eerror "The modern_kernel USE flag requires kernel version 3.18 or newer to work properly."
		fi
		CONFIG_CHECK="~NF_TABLES"
		linux-info_pkg_setup
	else
		eerror "This package requires kernel version 3.13 or newer to work properly."
	fi
}

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	local myeconfargs=(
		--sbindir="${EPREFIX}"/sbin
		$(use_enable python)
		$(use_enable debug)
		$(use_enable doc man-doc)
		$(use_with !gmp mini_gmp)
		$(use_with json)
		$(use_with xtables)
		$(if use !cli; then use_with cli; fi)
	)
	econf "${myeconfargs[@]}"
}

src_install() {
	default

	local mksuffix=""
	use modern_kernel && mksuffix="-mk"

	exeinto /usr/libexec/${PN}
	newexe "${FILESDIR}"/libexec/${PN}${mksuffix}.sh ${PN}.sh
	newconfd "${FILESDIR}"/${PN}${mksuffix}.confd ${PN}
	newinitd "${FILESDIR}"/${PN}${mksuffix}.init ${PN}
	keepdir /var/lib/nftables

	docinto /usr/share/doc/${PF}/skels
	dodoc -r "${D}"/etc/nftables/*
	rm -R "${D}"/etc/nftables
}

pkg_postinst() {
	local save_file
	save_file="${EROOT%/}/var/lib/nftables/rules-save"

	# In order for the nftables-restore systemd service to start
	# the save_file must exist.
	if [[ ! -f ${save_file} ]]; then
		touch ${save_file}
	fi

	elog "If you are creating firewall rules before the next system restart "
	elog "the nftables-restore service must be manually started in order to "
	elog "save those rules on shutdown."
}

# vim: noet sw=4 ts=4