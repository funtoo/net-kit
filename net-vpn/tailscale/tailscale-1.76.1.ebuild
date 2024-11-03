# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit go-module tmpfiles

VERSION_SHORT="1.76.1"
VERSION_LONG="1.76.1-t6ab01557c"

DESCRIPTION="Tailscale vpn client"
HOMEPAGE="https://tailscale.com"
SRC_URI="https://github.com/tailscale/tailscale/tarball/6ab01557c3a7525045d73f140f8c8a2fcffadb47 -> tailscale-1.76.1-6ab0155.tar.gz
https://direct.funtoo.org/53/07/0b/53070beebaa3049ef7d164a0140b1274ce351b6b18fffadb5533fe0598c3c20819aba90e4944334288adbdaa47ad675c191c10653b092e453d050daa8ff3cbb6 -> tailscale-1.76.1-funtoo-go-bundle-9db89d219a3d7150d5bf7fac651c8bb1c1bf27b7bbc3ec87864f4e9114eb98f304e6529b5c0522db728492a571bd647aa4519b7144cfb6f57dea652d8ef05d69.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"

RDEPEND="net-firewall/iptables"
S="${WORKDIR}/tailscale-tailscale-6ab0155"

# This translates the build command from upstream's build_dist.sh to an
# ebuild equivalent.
build_dist() {
	go build -tags xversion -ldflags "
		-X tailscale.com/version.longStamp=${VERSION_LONG}
		-X tailscale.com/version.shortStamp=${VERSION_SHORT}" "$@"
}

src_compile() {
	build_dist ./cmd/tailscale
	build_dist ./cmd/tailscaled
}

src_install() {
	dosbin tailscaled
	dobin tailscale

	insinto /etc/default
	newins cmd/tailscaled/tailscaled.defaults tailscaled
	keepdir /var/lib/${PN}
	fperms 0750 /var/lib/${PN}

	newtmpfiles "${FILESDIR}/${PN}.tmpfiles" ${PN}.conf

	newinitd "${FILESDIR}/${PN}d.initd" ${PN}
	newconfd "${FILESDIR}/${PN}d.confd" ${PN}
}

pkg_postinst() {
	tmpfiles_process ${PN}.conf
}