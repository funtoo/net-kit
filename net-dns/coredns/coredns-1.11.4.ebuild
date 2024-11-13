# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

go-module_set_globals

DESCRIPTION="CoreDNS is a DNS server that chains plugins"
HOMEPAGE="https://coredns.io/ https://github.com/coredns/coredns"
SRC_URI="https://github.com/coredns/coredns/tarball/6e11ebddfc13bfca683fcbcae72cc4af6de47dd2 -> coredns-1.11.4-6e11ebd.tar.gz
https://direct.funtoo.org/3f/22/01/3f220181796ce8b681fb15fd2250932ce80d37b85695f0a015086e76cc3ee8c8eaa210dba1db15516c916f898e11abf9b9318437b2e36dfe43d59d28745dee4a -> coredns-1.11.4-funtoo-go-bundle-7b0dd11379a9e0dd3257d978090051e6412722a2267933d88ce1b00e9e57995099eb0320432e37c97f9ac02a527d7823fbecdff62acbb157babd1627c902ae63.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="*"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=">=dev-lang/go-1.21"
S="${WORKDIR}/coredns-coredns-6e11ebd"

src_compile() {
	CGO_ENABLED=0 GOTOOLCHAIN=local \
	go build -v \
	-ldflags="-s -w -X github.com/coredns/coredns/coremain.GitCommit=6e11ebd" \
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