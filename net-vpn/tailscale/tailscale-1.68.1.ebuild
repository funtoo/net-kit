# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit go-module tmpfiles

VERSION_SHORT="1.68.1"
VERSION_LONG="1.68.1-tf02ad8397"

DESCRIPTION="Tailscale vpn client"
HOMEPAGE="https://tailscale.com"
SRC_URI="https://github.com/tailscale/tailscale/tarball/f02ad839770b7d1453e88d64b02162ce81cdd7a8 -> tailscale-1.68.1-f02ad83.tar.gz
https://direct.funtoo.org/38/72/95/3872950cd8255fb7eb07ff06cb70a150c52c2ceebb29a75c5920ad84d0b33c727689778fc1dd651a64c80af1f232ab8fd27530a30cf9b0846b19999b4de9f413 -> tailscale-1.68.1-funtoo-go-bundle-b05ccfaaa7d325490259cdf7caa0fb0dd96fe9610c6346a5b2b00bfee34ec8681c7f64659ece64416a5b39b9bde2cad3ebd75e031f2fefff275f1ffc377edc91.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"

RDEPEND="net-firewall/iptables"
S="${WORKDIR}/tailscale-tailscale-f02ad83"

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