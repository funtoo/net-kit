# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

go-module_set_globals

DESCRIPTION="CoreDNS is a DNS server that chains plugins"
HOMEPAGE="https://coredns.io/ https://github.com/coredns/coredns"
SRC_URI="https://github.com/coredns/coredns/tarball/51e11f166ef6c247a78e9e15468647c593b79b9f -> coredns-1.12.0-51e11f1.tar.gz
https://direct.funtoo.org/5f/55/e1/5f55e1bf5ca1b0275cb358a29b9e0d40d22c6088f08de7a583ef0d20b90cea496b82dfb6d4601594592c09279d13f2f48276237ba7368a6a2214fcba46faf909 -> coredns-1.12.0-funtoo-go-bundle-22a5c9bf6b1fa7fdf6ba493fa57174e1e403ca921d22ab958cd55e8512c5b609c4240c7d98163372f56de57d52c133f43d0f7e2a79022b5f9a3a161e20405776.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="*"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=">=dev-lang/go-1.21"
S="${WORKDIR}/coredns-coredns-51e11f1"

src_compile() {
	CGO_ENABLED=0 GOTOOLCHAIN=local \
	go build -v \
	-ldflags="-s -w -X github.com/coredns/coredns/coremain.GitCommit=51e11f1" \
	-o coredns
}

src_install() {
	dobin ${PN}
	insinto /etc/"${PN}"
	doins "${FILESDIR}"/Corefile
	dodoc README.md
	doman man/*

	newinitd "${FILESDIR}"/"${PN}".initd ${PN}
	newconfd "${FILESDIR}"/"${PN}".confd ${PN}
	keepdir /var/log/"${PN}"
}