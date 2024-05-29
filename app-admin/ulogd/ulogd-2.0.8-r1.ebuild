# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit flag-o-matic linux-info readme.gentoo-r1 user

DESCRIPTION="A userspace logging daemon for netfilter/iptables related logging"
HOMEPAGE="https://netfilter.org/projects/ulogd/index.html"
SRC_URI="https://www.netfilter.org/pub/ulogd2/ulogd-2.0.8.tar.bz2 -> ulogd-2.0.8.tar.bz2
"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="*"
IUSE="dbi doc json mysql nfacct +nfct +nflog pcap postgres selinux sqlite ulog"

DEPEND="
	|| ( net-firewall/iptables net-firewall/nftables )
	>=net-libs/libnfnetlink-1.0.1
	dbi? ( dev-db/libdbi )
	json? ( dev-libs/jansson:= )
	nfacct? (
		>=net-libs/libmnl-1.0.4
		>=net-libs/libnetfilter_acct-1.0.3
	)
	nfct? ( >=net-libs/libnetfilter_conntrack-1.0.6 )
	nflog? ( >=net-libs/libnetfilter_log-1.0.2 )
	mysql? ( dev-db/mysql-connector-c:= )
	pcap? ( net-libs/libpcap )
	postgres? ( dev-db/postgresql:= )
	sqlite? ( dev-db/sqlite:3 )
"
RDEPEND="
	${DEPEND}
	selinux? ( sec-policy/selinux-ulogd )
"
BDEPEND="
	virtual/pkgconfig
	doc? (
		app-text/linuxdoc-tools
		app-text/openjade
		app-text/texlive-core
		dev-texlive/texlive-fontsrecommended
		virtual/latex-base
	)
"

DISABLE_AUTOFORMATTING=1
DOC_CONTENTS="
	You must have at least one logging stack enabled to make ulogd work.
	Please edit the example configuration located at '${EPREFIX}/etc/ulogd.conf'.
"

pkg_setup() {
	linux-info_pkg_setup

	if use nfacct && kernel_is lt 3 3 0; then
		ewarn "NFACCT input plugin requires a kernel >= 3.3."
	fi

	if use ulog && kernel_is ge 3 17 0; then
		ewarn "ULOG target has been removed in the 3.17 kernel release."
		ewarn "Consider enabling NFACCT, NFCT, or NFLOG support instead."
	fi
	
	enewgroup ulogd 311
	enewuser ulogd 311 -1 /dev/null ulogd
}

src_prepare() {
	default

	# Change default settings to:
	# - keep log files in /var/log/ulogd instead of /var/log;
	# - create sockets in /run instead of /tmp.
	sed -i \
		-e "s|var/log|var/log/${PN}|g" \
		-e 's|tmp|run|g' \
		ulogd.conf.in || die
}

src_configure() {
	append-lfs-flags

	local myeconfargs=(
		$(use_enable dbi)
		$(use_enable json)
		$(use_enable nfacct)
		$(use_enable nfct)
		$(use_enable nflog)
		$(use_enable mysql)
		$(use_enable pcap)
		$(use_enable postgres pgsql)
		$(use_enable sqlite sqlite3)
		$(use_enable ulog)
	)

	econf "${myeconfargs[@]}"
}

src_compile() {
	default

	if use doc; then
		# Prevent access violations from bitmap font files generation.
		export VARTEXFONTS="${T}/fonts"
		emake -C doc
	fi
}


src_install() {
	use doc && HTML_DOCS=( doc/${PN}.html )

	default

	find "${ED}" -name '*.la' -delete || die

	readme.gentoo_create_doc
	doman ${PN}.8

	use doc && dodoc doc/${PN}.{dvi,ps,txt}
	use mysql && dodoc doc/mysql-*.sql
	use postgres && dodoc doc/pgsql-*.sql
	use sqlite && dodoc doc/sqlite3.table

	# change the default config to one that works
	# install upstream's config as a sample
	mv ${PN}.conf{,.example}
	insinto /etc
	doins ${FILESDIR}/${PN}.conf ${PN}.conf.example
	fowners root:ulogd /etc/${PN}.conf{,.example}
	fperms 640 /etc/${PN}.conf{,.example}

	newinitd "${FILESDIR}/${PN}.init" ${PN}

	insinto /etc/logrotate.d
	newins "${FILESDIR}/${PN}.logrotate" ${PN}

	diropts -o ulogd -g ulogd
	keepdir /var/log/ulogd
}

pkg_postinst() {
	readme.gentoo_print_elog
}
# vim: ts=4 noet syn=ebuild