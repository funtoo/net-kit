# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop eutils xdg

DESCRIPTION="Official desktop client for Telegram (binary package)"
HOMEPAGE="https://desktop.telegram.org"
SRC_URI="
	https://github.com/telegramdesktop/tdesktop/archive/v4.5.3.tar.gz -> tdesktop-4.5.3.tar.gz
	https://github.com/telegramdesktop/tdesktop/releases/download/v4.5.3/tsetup.4.5.3.tar.xz -> tsetup.4.5.3.tar.xz
"

LICENSE="GPL-3-with-openssl-exception"
SLOT="0"
KEYWORDS="-* amd64"

QA_PREBUILT="usr/lib/${PN}/Telegram"

RDEPEND="
	dev-libs/glib:2
	dev-libs/gobject-introspection
	>=media-libs/fontconfig-2.13
	>=sys-apps/dbus-1.4.20
	x11-libs/libX11
	>=x11-libs/libxcb-1.10[xkb]
"

S="${WORKDIR}/Telegram"

src_install() {
	exeinto /usr/lib/${PN}
	doexe "Telegram"
	newbin "${FILESDIR}"/${PN} "telegram-desktop"

	local icon_size
	for icon_size in 16 32 48 64 128 256 512; do
		newicon -s "${icon_size}" \
			"${WORKDIR}/tdesktop-${PV}/Telegram/Resources/art/icon${icon_size}.png" \
			telegram.png
	done

    sed -i '/SingleMainWindow=true/d' "${WORKDIR}/tdesktop-${PV}"/lib/xdg/org.telegram.desktop.desktop
	domenu "${WORKDIR}/tdesktop-${PV}"/lib/xdg/org.telegram.desktop.desktop
}

pkg_postinst() {
	xdg_pkg_postinst
	optfeature "spell checker support" app-text/enchant
}