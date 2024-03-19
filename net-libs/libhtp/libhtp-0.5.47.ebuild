# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit autotools multilib-minimal

DESCRIPTION="LibHTP is a security-aware parser for the HTTP protocol and the related bits and pieces. "
HOMEPAGE="https://github.com/OISF/libhtp"
SRC_URI="https://github.com/OISF/libhtp/tarball/b6c0d67001d8ab92cf9ef97f68c3f5475583725a -> libhtp-0.5.47-b6c0d67.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="*"
IUSE="debug static-libs"

RDEPEND="sys-libs/zlib[static-libs?]"
DEPEND="${RDEPEND}"

post_src_unpack() {
	if [ ! -d "${S}" ]; then
		mv OISF-libhtp-* "${S}" || die
	fi
}

src_prepare() {
	eautoreconf
	default
}

multilib_src_configure() {
	# The debug configure logic is broken.
	ECONF_SOURCE=${S} \
	econf \
		$(usex debug '--enable-debug' '') \
		$(use_enable static-libs static)
}

multilib_src_install_all() {
	use static-libs || find "${ED}" -name '*.la' -delete
}