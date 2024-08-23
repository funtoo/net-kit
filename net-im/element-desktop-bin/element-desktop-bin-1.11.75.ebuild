# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop unpacker xdg


MY_PN="${PN/-bin/}"

DESCRIPTION="A feature-rich client for Matrix.org"
HOMEPAGE="https://element.io"
SRC_URI="https://packages.element.io/debian/pool/main/e/element-desktop/element-desktop_1.11.75_amd64.deb -> element-desktop_1.11.75_amd64.deb"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="*"

RDEPEND="
	|| (
		>=app-accessibility/at-spi2-core-2.46.0:2
		( app-accessibility/at-spi2-atk dev-libs/atk )
	)
	app-crypt/libsecret
	dev-db/sqlcipher
	dev-libs/expat
	dev-libs/glib:2
	dev-libs/nettle
	dev-libs/nspr
	dev-libs/nss
	media-libs/alsa-lib
	media-libs/mesa
	net-print/cups
	sys-apps/dbus
	x11-libs/cairo
	x11-libs/gdk-pixbuf:2
	x11-libs/gtk+:3
	x11-libs/libX11
	x11-libs/libXcomposite
	x11-libs/libXdamage
	x11-libs/libXext
	x11-libs/libXfixes
	x11-libs/libXrandr
	x11-libs/libdrm
	x11-libs/libxcb
	x11-libs/libxkbcommon
	x11-libs/pango"
QA_PREBUILT="opt/Element/chrome-sandbox
	opt/Element/chrome_crashpad_handler
	opt/Element/element-desktop
	opt/Element/libEGL.so
	opt/Element/libGLESv2.so
	opt/Element/libffmpeg.so
	opt/Element/libvk_swiftshader.so
	opt/Element/libvulkan.so.1
	opt/Element/resources/app.asar.unpacked/node_modules/matrix-seshat/index.node
	opt/Element/resources/app.asar.unpacked/node_modules/keytar/build/Release/keytar.node"

S="${WORKDIR}"

src_install() {
	mv usr/share/doc/${MY_PN} usr/share/doc/${PF} || die
	gunzip usr/share/doc/${PF}/changelog.gz || die

	insinto /
	doins -r usr
	doins -r opt
	local f
	for f in ${QA_PREBUILT}; do
		fperms +x "/${f}"
	done
	fperms u+s /opt/Element/chrome-sandbox

	dosym ../../opt/Element/${MY_PN} /usr/bin/${MY_PN}
	dosym ${MY_PN} /usr/bin/riot-desktop
}