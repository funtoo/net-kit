# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3+ )
PYTHON_REQ_USE="threads(+)"

inherit cmake-utils python-r1

DESCRIPTION="C++ BitTorrent implementation focusing on efficiency and scalability"
HOMEPAGE="https://libtorrent.org https://github.com/arvidn/libtorrent"
SRC_URI="https://github.com/arvidn/libtorrent/releases/download/v2.0.1/libtorrent-rasterbar-2.0.1.tar.gz -> libtorrent-rasterbar-2.0.1.tar.gz"

LICENSE="BSD"
SLOT="0/11"
KEYWORDS="*"
IUSE="debug +dht doc examples gnutls libressl python +ssl static-libs test"

REQUIRED_USE="
	python? ( ${PYTHON_REQUIRED_USE} )
	gnutls? ( ssl )
	libressl? ( ssl )
"

RESTRICT="!test? ( test )"

RDEPEND="
	>=dev-libs/boost-1.72:=[threads]
	examples? ( !net-p2p/mldonkey )
	python? (
		${PYTHON_DEPS}
		dev-libs/boost:=[python,${PYTHON_USEDEP}]
	)
	ssl? (
		gnutls? ( net-libs/gnutls:0= )
		!gnutls? (
			!libressl? ( dev-libs/openssl:0= )
			libressl? ( dev-libs/libressl:= )
		)
	)
"
DEPEND="${RDEPEND}
	sys-devel/libtool
"

pkg_setup() {
	use python && python_setup
}

src_configure() {
	append-cflags -Wno-dev
	append-cxxflags -Wno-dev -std=c++14

	local mycmakeargs=(
		-Dlogging=$(usex debug ON OFF)
		-Ddht=$(usex dht ON OFF)
		-Dbuild_examples=$(usex examples ON OFF)
		-Dencryption=$(usex ssl ON OFF)
		-DBUILD_SHARED_LIBS=$(usex static-libs OFF ON)
		-Dbuild_tests=$(usex test ON OFF)
		-Dgnutls=$(usex gnutls ON OFF)
	)

	if use python; then
		python_configure() {
			BUILD_DIR="${BUILD_DIR}_build"
			mycmakeargs+=(
				-Dpython-bindings=ON
				-Dboost-python-module-name="${EPYTHON}"
			)
			cmake-utils_src_configure
		}
		python_foreach_impl python_configure
	else
		cmake-utils_src_configure
	fi
}

src_compile() {
	python_compile() {
		BUILD_DIR="${BUILD_DIR}_build"
		cmake-utils_src_compile
	}

	if use python; then
		python_foreach_impl python_compile
	else
		cmake-utils_src_compile
	fi
}

src_install() {
	use doc && HTML_DOCS+=( "${S}"/docs )

	python_install() {
		BUILD_DIR="${BUILD_DIR}_build"
		cmake-utils_src_install
	}

	if use python; then
		python_foreach_impl python_install
		python_optimize
	else
		cmake-utils_src_install
	fi
}