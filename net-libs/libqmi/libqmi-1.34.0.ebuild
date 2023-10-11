# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="Qualcomm MSM (Mobile Station Modem) Interface (QMI) modem protocol library"
HOMEPAGE="https://www.freedesktop.org/wiki/Software/libqmi/ https://gitlab.freedesktop.org/mobile-broadband/libqmi"
SRC_URI="https://gitlab.freedesktop.org/mobile-broadband/libqmi/-/archive/1.34.0/libqmi-1.34.0.tar.bz2 -> libqmi-1.34.0.tar.bz2"

LICENSE="LGPL-2"
SLOT="0/5.8"	# soname of libqmi-glib.so
KEYWORDS="*"
IUSE="gtk-doc +mbim +qrtr"

RDEPEND=">=dev-libs/glib-2.56
	>=dev-libs/libgudev-232
	mbim? ( >=net-libs/libmbim-1.18.0 )
	qrtr? ( >=net-libs/libqrtr-glib-1.0.0:= )
"
DEPEND="${RDEPEND}"
BDEPEND="
	app-shells/bash-completion
	virtual/pkgconfig
	gtk-doc? ( dev-util/gtk-doc )"

src_configure() {
	local emesonargs=(
		$(meson_use qrtr)
		$(meson_use mbim mbim_qmux)
		$(meson_use gtk-doc gtk_doc)
		$(meson_use qrtr)
	)
	meson_src_configure
}