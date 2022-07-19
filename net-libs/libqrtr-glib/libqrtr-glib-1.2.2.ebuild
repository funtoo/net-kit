# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="Qualcomm IPC Router protocol helper library"
HOMEPAGE="https://gitlab.freedesktop.org/mobile-broadband/libqrtr-glib"
SRC_URI="https://gitlab.freedesktop.org/mobile-broadband/libqrtr-glib/-/archive/1.2.2/libqrtr-glib-1.2.2.tar.bz2 -> libqrtr-glib-1.2.2.tar.bz2"

LICENSE="LGPL-2"
SLOT="0/0"	# soname of libqrtr-glib.so
KEYWORDS="*"
IUSE="gtk-doc"

RDEPEND="
	>=dev-libs/glib-2.56:2
	dev-libs/gobject-introspection
"
DEPEND="${RDEPEND}"
BDEPEND="
	virtual/pkgconfig
	gtk-doc? ( dev-util/gtk-doc )
"

src_configure() {
	local emesonargs=(
		-Dintrospection=true
		$(meson_use gtk-doc gtk_doc)
	)
	meson_src_configure
}