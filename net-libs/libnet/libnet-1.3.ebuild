# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit autotools eutils

DESCRIPTION="library providing an API for commonly used low-level network functions"
HOMEPAGE="http://libnet-dev.sourceforge.net/ https://github.com/sam-github/libnet"
SRC_URI="https://github.com/libnet/libnet/tarball/deaebdfe2743e8a6f04d3c307d9272afeeecfade -> libnet-1.3-deaebdf.tar.gz"

LICENSE="BSD BSD-2 HPND"
SLOT="1.1"
KEYWORDS="*"
IUSE="doc static-libs"

DOCS=(
	README.md doc/{CHANGELOG,CONTRIB,DESIGN_NOTES,MIGRATION.md}
	doc/{PACKET_BUILDING,PORTED,RAWSOCKET.md,TODO.md}
)

post_src_unpack() {
	if [ ! -d "${WORKDIR}/${S}" ]; then
		mv "${WORKDIR}"/* "${S}" || die
	fi
}

src_prepare() {
	default

	eautoreconf
}
src_configure() {
	econf $(use_enable static-libs static)
}

src_install() {
	default

	if use doc ; then
		docinto html
		dodoc -r doc/html/*
		docinto sample
		dodoc sample/*.[ch]
	fi

	find "${D}" -name '*.la' -delete || die
}