# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit go-module tmpfiles

VERSION_SHORT="1.40.1"
VERSION_LONG="1.40.1-td2684863c"

DESCRIPTION="Tailscale vpn client"
HOMEPAGE="https://tailscale.com"
SRC_URI="https://github.com/tailscale/tailscale/tarball/d2684863c20404422fe0b35d9dba965359e02705 -> tailscale-1.40.1-d268486.tar.gz
https://direct.funtoo.org/80/8b/a1/808ba12fb975735637c6b819f936d166c3d8c92b71959eb4da6e959797aa75dabc2715cb0b309b84362d385a4e82e70e99a4665b263e4479eaa21fa4713d0909 -> tailscale-1.40.1-funtoo-go-bundle-268ca18b963064565c82e8c4591b335f3a19b6c8f997cce3cc733036a07f18f7e99c884137af609749ce561d0715e263db32f07c6fbcab160ce67ab059c0f012.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"

RDEPEND="net-firewall/iptables"
S="${WORKDIR}/tailscale-tailscale-d268486"

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