# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit go-module tmpfiles

VERSION_SHORT="1.48.0"
VERSION_LONG="1.48.0-t77c732357"

DESCRIPTION="Tailscale vpn client"
HOMEPAGE="https://tailscale.com"
SRC_URI="https://github.com/tailscale/tailscale/tarball/77c732357bd891ff062b8aeeac5489f85315f261 -> tailscale-1.48.0-77c7323.tar.gz
https://direct.funtoo.org/99/d0/9c/99d09c6dc850a3703313d49590566ce66133c8bfcf0acbef437b0cdeeb4a56a7186f6273fa544372939007f248e96a3738740f1583194931c266a2147377013e -> tailscale-1.48.0-funtoo-go-bundle-77b07373144ba54b2d274ef6deab24a0c4e9b2e4b6a3b7b0dacf7fdb7bef6430892218675605c7ab0ff9caabb4e66eca9b5b91d09ccc97654a5259eab8cb8f93.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"

RDEPEND="net-firewall/iptables"
S="${WORKDIR}/tailscale-tailscale-77c7323"

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