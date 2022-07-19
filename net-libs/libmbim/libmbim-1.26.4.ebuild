# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools

DESCRIPTION="Mobile Broadband Interface Model (MBIM) modem protocol helper library"
HOMEPAGE="https://www.freedesktop.org/wiki/Software/libmbim/ https://gitlab.freedesktop.org/mobile-broadband/libmbim"
SRC_URI="https://gitlab.freedesktop.org/mobile-broadband/libmbim/-/archive/1.26.4/libmbim-1.26.4.tar.bz2 -> libmbim-1.26.4.tar.bz2"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="*"

RDEPEND=">=dev-libs/glib-2.56:2"
DEPEND="${RDEPEND}"
BDEPEND="
	dev-util/glib-utils
	virtual/pkgconfig
"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf \
		--disable-Werror \
		--disable-static \
		--disable-gtk-doc
}

src_install() {
	default
	find "${ED}" -name '*.la' -delete || die
}