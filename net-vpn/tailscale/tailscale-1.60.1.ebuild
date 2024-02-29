# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit go-module tmpfiles

VERSION_SHORT="1.60.1"
VERSION_LONG="1.60.1-ta8e06a7df"

DESCRIPTION="Tailscale vpn client"
HOMEPAGE="https://tailscale.com"
SRC_URI="https://github.com/tailscale/tailscale/tarball/a8e06a7df8a712f095e12888ae37bfd3a270c825 -> tailscale-1.60.1-a8e06a7.tar.gz
https://direct.funtoo.org/3d/25/d7/3d25d7c469df7fb7d4aa6daf40758ca85413352d08d25921dfcb0fe3f25ca992998a6c6e8a612a683b8100c94b296d2b19aa74b0b6a98246791b6f029f4c311f -> tailscale-1.60.1-funtoo-go-bundle-a977a154aedb40ca7ebc336d6a6279956d7ca6d03df187d56f1d658cca0083ed05776cd7da4ccb6fa34216a5671cba44951835970a124547dde7b24d567cb498.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"

RDEPEND="net-firewall/iptables"
S="${WORKDIR}/tailscale-tailscale-a8e06a7"

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