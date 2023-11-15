# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit go-module tmpfiles

VERSION_SHORT="1.54.0"
VERSION_LONG="1.54.0-t42cae6916"

DESCRIPTION="Tailscale vpn client"
HOMEPAGE="https://tailscale.com"
SRC_URI="https://github.com/tailscale/tailscale/tarball/42cae6916c6b06b6d0a686477f96d48a0b49aeb6 -> tailscale-1.54.0-42cae69.tar.gz
https://direct.funtoo.org/c1/e3/b5/c1e3b516dc3bf83fe18b9b255ba0385294aa8c473416cfd358fb7a8eefbe5480e9d7ce1f45b625dfd1cb56dc75af3970f6db9f375a416976171b9d285995c55e -> tailscale-1.54.0-funtoo-go-bundle-d1b49b2f06536e593da387339f02a45b12810da37c6090fb6a53a81943b135705a080c291bec92caba8bd61cca3d5a3546c0554b6c2b464a990a64a2d8eb9ec4.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"

RDEPEND="net-firewall/iptables"
S="${WORKDIR}/tailscale-tailscale-42cae69"

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