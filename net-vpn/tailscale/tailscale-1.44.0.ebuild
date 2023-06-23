# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit go-module tmpfiles

VERSION_SHORT="1.44.0"
VERSION_LONG="1.44.0-tb3138a71a"

DESCRIPTION="Tailscale vpn client"
HOMEPAGE="https://tailscale.com"
SRC_URI="https://github.com/tailscale/tailscale/tarball/b3138a71ad0b2fb7d99f0dcecc5e4bc85483bb4f -> tailscale-1.44.0-b3138a7.tar.gz
https://direct.funtoo.org/9d/61/f8/9d61f87bfafb1d8c3141d3d08ab56eff6655538bf52c4a16c6bd7c5a5d0973cf7ab113b309aa83405587f3940254ccdbf264714177a28555f39a99ffbee6b198 -> tailscale-1.44.0-funtoo-go-bundle-2d8fa290eef2baa6ce76e81e0b9601addc43cd5b03c1428e41285e3d9751e6833769964f22c99543b4626694972465f5d650d8afa5f68ac6e80f0d6e1f5bca78.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"

RDEPEND="net-firewall/iptables"
S="${WORKDIR}/tailscale-tailscale-b3138a7"

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