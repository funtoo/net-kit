# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="Library implementing the SSH2 protocol"
HOMEPAGE="https://www.libssh2.org"
SRC_URI="https://www.libssh2.org/download/libssh2-1.11.0.tar.gz -> libssh2-1.11.0.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="*"
IUSE="gcrypt mbedtls zlib"
REQUIRED_USE="?? ( gcrypt mbedtls )"
# Tests try to set containers up using docker (and fail for some reason).
RESTRICT="test"

RDEPEND="
	gcrypt? ( >=dev-libs/libgcrypt-1.5.3:0 )
	!gcrypt? (
		mbedtls? ( net-libs/mbedtls:0= )
		!mbedtls? (
			>=dev-libs/openssl-1.0.1h-r2:0=
		)
	)
	zlib? ( >=sys-libs/zlib-1.2.8-r1 )
"
DEPEND="
	${RDEPEND}
"

src_configure() {
	local crypto_backend=OpenSSL
	if use gcrypt; then
		crypto_backend=Libgcrypt
	elif use mbedtls; then
		crypto_backend=mbedTLS
	fi

	local mycmakeargs=(
		-DBUILD_SHARED_LIBS=ON
		-DCRYPTO_BACKEND=${crypto_backend}
		-DENABLE_ZLIB_COMPRESSION=$(usex zlib)
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install
	find "${ED}" -name '*.la' -delete || die
}