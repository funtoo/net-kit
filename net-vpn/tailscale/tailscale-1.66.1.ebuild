# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit go-module tmpfiles

VERSION_SHORT="1.66.1"
VERSION_LONG="1.66.1-t8494e1762"

DESCRIPTION="Tailscale vpn client"
HOMEPAGE="https://tailscale.com"
SRC_URI="https://github.com/tailscale/tailscale/tarball/8494e176298ad20f25d761a4eaf5562b24538811 -> tailscale-1.66.1-8494e17.tar.gz
https://direct.funtoo.org/8d/e7/59/8de7591e37a0461ba16ba6fa8b66dafc8b582639588d5f88edc56863a4c28115144386408833c97bfd2db8f4fc6e80c49a8976efefe059ceb8c44763d404a120 -> tailscale-1.66.1-funtoo-go-bundle-54cca0a29d0abbe77282fa7e0be858e17f805ddc7883eeef0c9a3dd4b7b146098dc63ff33afb7c1870aaf6e3ea1d233d73b3bf3af55394abd71154ea0a2aa386.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"

RDEPEND="net-firewall/iptables"
S="${WORKDIR}/tailscale-tailscale-8494e17"

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