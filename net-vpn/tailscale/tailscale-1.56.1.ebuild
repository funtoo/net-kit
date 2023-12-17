# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit go-module tmpfiles

VERSION_SHORT="1.56.1"
VERSION_LONG="1.56.1-t906f85d10"

DESCRIPTION="Tailscale vpn client"
HOMEPAGE="https://tailscale.com"
SRC_URI="https://github.com/tailscale/tailscale/tarball/906f85d10c0b7b653116db19913ebeab85ee01ec -> tailscale-1.56.1-906f85d.tar.gz
https://direct.funtoo.org/8a/bb/9b/8abb9be6e0e90f61710b7279dd1945b9ae2eb4b019a02f60c3cb5545a1e6bbe8bc661833d9ec6778e068dc384d86c260caa10ec2974f5c4084808a8cc4fdb59a -> tailscale-1.56.1-funtoo-go-bundle-d502fa13f0dbe9d2599b8c9966a018510cc210bfd392976b07e902acb18c300e7b29e965c842925a6ac9dac45ed9fe4f86be59d09c571d2094328e739edb26db.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"

RDEPEND="net-firewall/iptables"
S="${WORKDIR}/tailscale-tailscale-906f85d"

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