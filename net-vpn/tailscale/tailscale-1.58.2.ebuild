# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit go-module tmpfiles

VERSION_SHORT="1.58.2"
VERSION_LONG="1.58.2-t6a2a8457f"

DESCRIPTION="Tailscale vpn client"
HOMEPAGE="https://tailscale.com"
SRC_URI="https://github.com/tailscale/tailscale/tarball/6a2a8457f0d62c775bfee3e350d2b34d85eda0f5 -> tailscale-1.58.2-6a2a845.tar.gz
https://direct.funtoo.org/e9/ad/4a/e9ad4afd63031f281e88473509db9d576eb38be3b04438c1e47d399d0a9cb98b4466d3ec5ef8fed0f4a7432c3fa7e533c735bc231ffa83d3f41b2e5fce510264 -> tailscale-1.58.2-funtoo-go-bundle-c08cfbd633dea69bb8198adc08ed42758ac792a0aa0dfc9c56fa2dac28f9e862f44a747966704302c383bcc73c5a08186c5d4af33de280f6ca146afa89e561f0.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"

RDEPEND="net-firewall/iptables"
S="${WORKDIR}/tailscale-tailscale-6a2a845"

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