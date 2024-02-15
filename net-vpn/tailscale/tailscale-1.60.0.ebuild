# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit go-module tmpfiles

VERSION_SHORT="1.60.0"
VERSION_LONG="1.60.0-tb36943c9b"

DESCRIPTION="Tailscale vpn client"
HOMEPAGE="https://tailscale.com"
SRC_URI="https://github.com/tailscale/tailscale/tarball/b36943c9b3cfc9f917b202025bfde002b076fc87 -> tailscale-1.60.0-b36943c.tar.gz
https://direct.funtoo.org/2e/30/c7/2e30c713e43a98db6fda1fa0e1e65eaa2cf9a8b323e81471738c83d3fbcd36969d3d4cb7661f69f742f4c301932149423a2ca0c8add23446d51e05b042d89597 -> tailscale-1.60.0-funtoo-go-bundle-a977a154aedb40ca7ebc336d6a6279956d7ca6d03df187d56f1d658cca0083ed05776cd7da4ccb6fa34216a5671cba44951835970a124547dde7b24d567cb498.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"

RDEPEND="net-firewall/iptables"
S="${WORKDIR}/tailscale-tailscale-b36943c"

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