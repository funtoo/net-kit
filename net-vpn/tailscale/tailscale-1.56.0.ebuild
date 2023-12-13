# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit go-module tmpfiles

VERSION_SHORT="1.56.0"
VERSION_LONG="1.56.0-tf10be754c"

DESCRIPTION="Tailscale vpn client"
HOMEPAGE="https://tailscale.com"
SRC_URI="https://github.com/tailscale/tailscale/tarball/f10be754cff7224afda35acdf580a808e0838538 -> tailscale-1.56.0-f10be75.tar.gz
https://direct.funtoo.org/6d/4c/46/6d4c464c6d7b2ee0e6f981c07bf672f6d694b0cfc0e140ea37be17f12dab6f2856caed6e35da14692bac2b1b833cd2746d1de7fbbab5e12851af8db3a4d9aaf4 -> tailscale-1.56.0-funtoo-go-bundle-d502fa13f0dbe9d2599b8c9966a018510cc210bfd392976b07e902acb18c300e7b29e965c842925a6ac9dac45ed9fe4f86be59d09c571d2094328e739edb26db.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"

RDEPEND="net-firewall/iptables"
S="${WORKDIR}/tailscale-tailscale-f10be75"

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