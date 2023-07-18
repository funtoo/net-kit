# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit go-module tmpfiles

VERSION_SHORT="1.44.2"
VERSION_LONG="1.44.2-tdcac3ed78"

DESCRIPTION="Tailscale vpn client"
HOMEPAGE="https://tailscale.com"
SRC_URI="https://github.com/tailscale/tailscale/tarball/dcac3ed784930d201ad184779442281bc524a47e -> tailscale-1.44.2-dcac3ed.tar.gz
https://direct.funtoo.org/ba/86/b9/ba86b9c6c93e0189f8b6441b11087a5b93731deccab843c0cb2d3d0fb8988b7825107e3c7c60ae8e5387c8ac8259c60c15d6759ec4db787b541321a3aae92e06 -> tailscale-1.44.2-funtoo-go-bundle-2d8fa290eef2baa6ce76e81e0b9601addc43cd5b03c1428e41285e3d9751e6833769964f22c99543b4626694972465f5d650d8afa5f68ac6e80f0d6e1f5bca78.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"

RDEPEND="net-firewall/iptables"
S="${WORKDIR}/tailscale-tailscale-dcac3ed"

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