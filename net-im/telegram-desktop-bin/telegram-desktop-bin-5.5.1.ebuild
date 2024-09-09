# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop eutils xdg

DESCRIPTION="Official desktop client for Telegram (binary package)"
HOMEPAGE="https://desktop.telegram.org"
SRC_URI="https://github.com/telegramdesktop/tdesktop/releases/download/v5.5.1/tdesktop-5.5.1-full.tar.gz -> tdesktop-5.5.1-full.tar.gz
https://github.com/telegramdesktop/tdesktop/releases/download/v5.5.1/tsetup.5.5.1.tar.xz -> tsetup.5.5.1.tar.xz"

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
SOURCE_DIR="${WORKDIR}/tdesktop-${PV}-full"

src_install() {
	exeinto /usr/lib/${PN}
	doexe "Telegram"
	newbin "${FILESDIR}"/${PN} "telegram-desktop"

	local icon_size
	for icon_size in 16 32 128 256 512; do
		newicon -s "${icon_size}" \
			"${SOURCE_DIR}/Telegram/Telegram/Images.xcassets/Icon.iconset/icon_${icon_size}x${icon_size}.png" \
			telegram.png
	done

    sed -i \
		-e '/SingleMainWindow=true/d' \
		-e '/DBusActivatable=true/d' \
		"${SOURCE_DIR}"/lib/xdg/org.telegram.desktop.desktop

	domenu "${SOURCE_DIR}"/lib/xdg/org.telegram.desktop.desktop
}

pkg_postinst() {
	xdg_pkg_postinst
	optfeature "spell checker support" app-text/enchant
}