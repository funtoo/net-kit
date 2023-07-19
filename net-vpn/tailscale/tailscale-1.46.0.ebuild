# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit go-module tmpfiles

VERSION_SHORT="1.46.0"
VERSION_LONG="1.46.0-t49cb73432"

DESCRIPTION="Tailscale vpn client"
HOMEPAGE="https://tailscale.com"
SRC_URI="https://github.com/tailscale/tailscale/tarball/49cb73432a2d909f0c842f9e8fd38253baa062a5 -> tailscale-1.46.0-49cb734.tar.gz
https://direct.funtoo.org/55/c5/84/55c584825eb0e5f390a0064d65b97e1307ce581556a51c450a3b927e812e4689f1555db095e6816ecb7adb3847fbea34ba9dc809e615d1e3d0324c244b7dec6a -> tailscale-1.46.0-funtoo-go-bundle-52c799f248e222ba7ef091da265d34b8158d2e8ca60ed48d04b01b802176645761b64b28a0f22bd5982997bf394954540e490908b3d0951a0c11ff55e14d0f34.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"

RDEPEND="net-firewall/iptables"
S="${WORKDIR}/tailscale-tailscale-49cb734"

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