# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit go-module tmpfiles

VERSION_SHORT="1.66.3"
VERSION_LONG="1.66.3-tc231c3da2"

DESCRIPTION="Tailscale vpn client"
HOMEPAGE="https://tailscale.com"
SRC_URI="https://github.com/tailscale/tailscale/tarball/c231c3da2c07751077039f158e6836cafc8c5f63 -> tailscale-1.66.3-c231c3d.tar.gz
https://direct.funtoo.org/6c/f4/88/6cf488c339d1a2244f92f4bea67b0e2e46c2f3e95805c7819ba834e500f967a01b18d2e4724734fda8142a873c032fff426a1efe70d5b1d0070a59db5fb59139 -> tailscale-1.66.3-funtoo-go-bundle-54cca0a29d0abbe77282fa7e0be858e17f805ddc7883eeef0c9a3dd4b7b146098dc63ff33afb7c1870aaf6e3ea1d233d73b3bf3af55394abd71154ea0a2aa386.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"

RDEPEND="net-firewall/iptables"
S="${WORKDIR}/tailscale-tailscale-c231c3d"

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