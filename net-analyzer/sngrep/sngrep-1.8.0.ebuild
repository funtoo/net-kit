# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools

DESCRIPTION="Ncurses SIP Messages flow viewer"
HOMEPAGE="https://github.com/irontec/sngrep"
SRC_URI="https://github.com/irontec/sngrep/tarball/f7b36df3b79617892958b67cb4ad9313c6ce72d2 -> sngrep-1.8.0-f7b36df.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="*"
IUSE="eep gnutls pcre ssl zlib"

DEPEND="
	net-libs/libpcap
	sys-libs/ncurses:=
	ssl? (
		!gnutls? ( dev-libs/openssl:= )
		gnutls? ( net-libs/gnutls:= )
	)
	pcre? ( dev-libs/libpcre2 )
	zlib? ( sys-libs/zlib )
"
RDEPEND="${DEPEND}"

post_src_unpack() {
	if [ ! -d "${S}" ]; then
		mv irontec-sngrep* "${S}" || die
	fi
}

src_prepare() {
	default

	eautoreconf
}

src_configure() {
	local myeconfargs=(
		--enable-ipv6
		--enable-unicode
		--without-pcre
		$(use_enable eep)
		$(use_with pcre pcre2)
		$(use_with ssl $(usex gnutls gnutls openssl))
		$(use_with zlib)
	)

	econf "${myeconfargs[@]}"
}