# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit linux-info

DESCRIPTION="Library providing interface to extended accounting infrastructure"
HOMEPAGE="https://netfilter.org/projects/libnetfilter_acct/"
SRC_URI="https://www.netfilter.org/pub/libnetfilter_acct/libnetfilter_acct-1.0.3.tar.bz2 -> libnetfilter_acct-1.0.3.tar.bz2
"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="*"
IUSE="examples"

RDEPEND="
	net-libs/libmnl
"
DEPEND="${RDEPEND}"
BDEPEND="virtual/pkgconfig"

DOCS=( README )

CONFIG_CHECK="~NETFILTER_NETLINK_ACCT"

pkg_setup() {
	kernel_is lt 3 3 && ewarn "This package will work with kernel version 3.3 or higher"
	linux-info_pkg_setup
}

src_configure() {
	econf \
		--libdir="${EPREFIX}"/$(get_libdir)
}

src_install() {
	default

	dodir /usr/$(get_libdir)/pkgconfig/
	mv "${ED}"/{,usr/}$(get_libdir)/pkgconfig/${PN}.pc || die

	if use examples; then
		find examples/ -name "Makefile*" -exec rm -f '{}' + || die 'find failed'
		dodoc -r examples/
		docompress -x /usr/share/doc/${P}/examples
	fi

	find "${ED}" -name '*.la' -delete || die

}
# vim: noet ts=4 syn=ebuild