# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit go-module tmpfiles

VERSION_SHORT="1.50.0"
VERSION_LONG="1.50.0-ta920f0231"

DESCRIPTION="Tailscale vpn client"
HOMEPAGE="https://tailscale.com"
SRC_URI="https://github.com/tailscale/tailscale/tarball/a920f02311d00d9bf8ba09503ec78fe6b054ca75 -> tailscale-1.50.0-a920f02.tar.gz
https://direct.funtoo.org/fd/91/2a/fd912acecb1cf0007e1389687781631d995175fbf29530f7bec216e01334201798652d75778d6357a3a0fd4af6891e750a31bbf4f8be51b436859fa72e94681f -> tailscale-1.50.0-funtoo-go-bundle-942e165b4beb3b5b72b5f10eb0814e33fb09e6af5adf8df816a244e120e5c44800c346de7d5a82430cc66c4d5615a9b26e885f47b30318d2aa5159088c2154b0.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"

RDEPEND="net-firewall/iptables"
S="${WORKDIR}/tailscale-tailscale-a920f02"

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