# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=(  )
DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 xdg

DESCRIPTION="Official git repo for the CHIRP project"
HOMEPAGE="https://github.com/kk7ds/chirp"
SRC_URI="https://github.com/kk7ds/chirp/tarball/db2277044456bb9e561835caa8a3ea29dd7eae97 -> chirp-0.4.0-db22770.tar.gz"

RESTRICT="test"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="*"
IUSE="radioreference"

DEPEND="${PYTHON_DEPS}
	dev-python/importlib_resources[${PYTHON_USEDEP}]
	dev-python/pyserial[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/yattag[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}
	>=dev-python/wxpython-4.0[${PYTHON_USEDEP}]
	!>=dev-python/wxpython-4.2.0[${PYTHON_USEDEP}]
	radioreference? ( dev-python/suds[${PYTHON_USEDEP}] )"

src_prepare() {
	distutils-r1_src_prepare
	xdg_src_prepare
}

src_install() {
	xdg_pkg_preinst

	pushd "${S}/chirp/share/" > /dev/null || die
		doman chirpw.1

		insinto /usr/share/icons/hicolor/256x256/
		doins chirp.png

		insinto /usr/share/icons/hicolor/scalable/apps/
		doins chirp.svg

		insinto /usr/share/applications
		doins chirp.desktop
	
		rm chirp.* || die
	popd > /dev/null || die

	distutils-r1_src_install
}
