# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit go-module tmpfiles

VERSION_SHORT="1.66.4"
VERSION_LONG="1.66.4-t067defc64"

DESCRIPTION="Tailscale vpn client"
HOMEPAGE="https://tailscale.com"
SRC_URI="https://github.com/tailscale/tailscale/tarball/067defc641850791142cc83a44dadae29709344a -> tailscale-1.66.4-067defc.tar.gz
https://direct.funtoo.org/4e/d8/a1/4ed8a1775024ad7c5ba0af62a64b22989b738053c3b8797b154d66c7574064bf7fb2e075b53afef946745a880d5aa69fa6fa1d576ed3cd6bfbdea23afe65e690 -> tailscale-1.66.4-funtoo-go-bundle-54cca0a29d0abbe77282fa7e0be858e17f805ddc7883eeef0c9a3dd4b7b146098dc63ff33afb7c1870aaf6e3ea1d233d73b3bf3af55394abd71154ea0a2aa386.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"

RDEPEND="net-firewall/iptables"
S="${WORKDIR}/tailscale-tailscale-067defc"

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