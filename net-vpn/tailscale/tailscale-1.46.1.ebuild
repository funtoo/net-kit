# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit go-module tmpfiles

VERSION_SHORT="1.46.1"
VERSION_LONG="1.46.1-t2d3223f55"

DESCRIPTION="Tailscale vpn client"
HOMEPAGE="https://tailscale.com"
SRC_URI="https://github.com/tailscale/tailscale/tarball/2d3223f557924d408b5d67b80440d6fba264a0fd -> tailscale-1.46.1-2d3223f.tar.gz
https://direct.funtoo.org/1b/8a/bd/1b8abdfc4b287b8aea89903e0301697bb40676754c8a67964cee0a632bfbfcb4bce2c7ee0f2c576fc7f205b4206dc926cd0f2b9e9d90bdab1a74097fa943ad81 -> tailscale-1.46.1-funtoo-go-bundle-52c799f248e222ba7ef091da265d34b8158d2e8ca60ed48d04b01b802176645761b64b28a0f22bd5982997bf394954540e490908b3d0951a0c11ff55e14d0f34.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"

RDEPEND="net-firewall/iptables"
S="${WORKDIR}/tailscale-tailscale-2d3223f"

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