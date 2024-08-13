# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

go-module_set_globals

DESCRIPTION="CoreDNS is a DNS server that chains plugins"
HOMEPAGE="https://coredns.io/ https://github.com/coredns/coredns"
SRC_URI="https://github.com/coredns/coredns/tarball/a7ed346585e30b99317d36e4d007b7b19a228ea5 -> coredns-1.11.3-a7ed346.tar.gz
https://direct.funtoo.org/b5/34/0d/b5340d08bdb73573248499b09fd28df397de2ad577177ef77179f1043e789b3c3d941b44998bb959f6d47bd7e6ec38866032216b75b5f76cf4c1cee608d3de55 -> coredns-1.11.3-funtoo-go-bundle-c176a278c92fedd12ca468562681e8e4067232fccde751ea62b548f59af5b39799140233e9dc7c15c95f3848eb8ae66b566dc002e2aeef20f6689ec2d9f66000.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="*"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=">=dev-lang/go-1.21"
S="${WORKDIR}/coredns-coredns-a7ed346"

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