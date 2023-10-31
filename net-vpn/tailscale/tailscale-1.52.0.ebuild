# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit go-module tmpfiles

VERSION_SHORT="1.52.0"
VERSION_LONG="1.52.0-t3c2ff1e4a"

DESCRIPTION="Tailscale vpn client"
HOMEPAGE="https://tailscale.com"
SRC_URI="https://github.com/tailscale/tailscale/tarball/3c2ff1e4a6177a3518addf8bfc64dda9671bd4b7 -> tailscale-1.52.0-3c2ff1e.tar.gz
https://direct.funtoo.org/21/cd/dc/21cddcb8b061a1f4d9abe762b4e96911e64184d4b1e7f70cb38a7ad63e186a0d4682762c30bdf4aef92a30ec32cff2f443f7fe01a896c60e6a478bd93e084a9f -> tailscale-1.52.0-funtoo-go-bundle-5ab38d2b36d636d6dfb4f3cdb0ba7359c7eded8e4fb4fbd5e13d219697754669550526dda14854394a9965a2204a3b024585f979cf2409dcc7d8330977b3af3b.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"

RDEPEND="net-firewall/iptables"
S="${WORKDIR}/tailscale-tailscale-3c2ff1e"

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