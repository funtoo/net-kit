# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit go-module tmpfiles

VERSION_SHORT="1.72.1"
VERSION_LONG="1.72.1-tc02a15244"

DESCRIPTION="Tailscale vpn client"
HOMEPAGE="https://tailscale.com"
SRC_URI="https://github.com/tailscale/tailscale/tarball/c02a1524467844f5a7e93edceb29226fe9fa089a -> tailscale-1.72.1-c02a152.tar.gz
https://direct.funtoo.org/02/13/51/021351e2f56fb35aca27cfd2ac4a762c0a40aa0bd14b83ad986f2eb5f06e832b0be13ac968e4e347202af8253b4b9aa5150ce7d5d482bbd3b8c352125fcb0698 -> tailscale-1.72.1-funtoo-go-bundle-4b235c449dd28501d8123343febd2703e1a3160323d496c7cabc0e2d500e32008ee1512b34acf2499c0192c09db02821581e40c558036e3a6653beb177d676bf.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"

RDEPEND="net-firewall/iptables"
S="${WORKDIR}/tailscale-tailscale-c02a152"

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