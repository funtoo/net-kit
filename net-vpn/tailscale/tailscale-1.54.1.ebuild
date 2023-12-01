# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit go-module tmpfiles

VERSION_SHORT="1.54.1"
VERSION_LONG="1.54.1-t0a01efc8f"

DESCRIPTION="Tailscale vpn client"
HOMEPAGE="https://tailscale.com"
SRC_URI="https://github.com/tailscale/tailscale/tarball/0a01efc8f894db55d0975d1926fd5347c548a7af -> tailscale-1.54.1-0a01efc.tar.gz
https://direct.funtoo.org/ec/84/9e/ec849eb1b85e0e975cf2c1e69622ffd96f9ebb6468b0e6adc9dadd5819d746ad1e7ee51fec20fe453d9df9f4a46d519183cd40c4ccde3e61d52eb3a33ee5663a -> tailscale-1.54.1-funtoo-go-bundle-d1b49b2f06536e593da387339f02a45b12810da37c6090fb6a53a81943b135705a080c291bec92caba8bd61cca3d5a3546c0554b6c2b464a990a64a2d8eb9ec4.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"

RDEPEND="net-firewall/iptables"
S="${WORKDIR}/tailscale-tailscale-0a01efc"

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