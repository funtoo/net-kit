# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

go-module_set_globals

DESCRIPTION="CoreDNS is a DNS server that chains plugins"
HOMEPAGE="https://coredns.io/ https://github.com/coredns/coredns"
SRC_URI="https://github.com/coredns/coredns/tarball/ae2bbc29be1aaae0b3ded5d188968a6c97bb3144 -> coredns-1.11.1-ae2bbc2.tar.gz
https://direct.funtoo.org/64/5c/19/645c19e278b7badcdba2a5810cf497896dfc8f43a14edff09ed19103e6a41e74056e5b8601e0acb71828577fe9066dcb6da53d5bc8996ceac572758b03261bdd -> coredns-1.11.1-funtoo-go-bundle-6f7fa279179e47791e8fa8d64a8aca3771e656e247c37637eb8996b1e4fa0cd0b7bb790cbd2d7e94e9ddb1bf47d2d44e34615d84796612ed6967f378549da170.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="*"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=">=dev-lang/go-1.21"
S="${WORKDIR}/coredns-coredns-ae2bbc2"

src_compile() {
	FORCE_HOST_GO=yes
	emake
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