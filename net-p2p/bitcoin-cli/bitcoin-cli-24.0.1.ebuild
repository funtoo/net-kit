# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools bash-completion-r1

DESCRIPTION="Command-line JSON-RPC client specifically for interfacing with bitcoind"
HOMEPAGE="https://bitcoincore.org/"
SRC_URI="https://bitcoincore.org/bin/bitcoin-core-24.0.1/bitcoin-24.0.1.tar.gz -> bitcoin-24.0.1.tar.gz"
S="${WORKDIR}"/${P/-cli}

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"

# TODO: Can we drop virtual/bitcoin-leveldb from some bitcoin-*?
# (only bitcoin-qt, bitcoind should need it?)
RDEPEND="
	dev-libs/boost:=
	dev-libs/libevent:=
	virtual/bitcoin-leveldb
"
DEPEND="${RDEPEND}"

DOCS=( doc/release-notes.md )

PATCHES=(
	"${FILESDIR}"/24.0.1-syslibs.patch
)

src_prepare() {
	default

	eautoreconf

	rm -r src/leveldb src/secp256k1 || die
}

src_configure() {
	local myeconfargs=(
		--disable-asm
		--without-qtdbus
		--disable-ebpf
		--without-natpmp
		--without-qrencode
		--without-miniupnpc
		--disable-tests
		--disable-wallet
		--disable-zmq
		--enable-util-cli
		--disable-util-tx
		--disable-util-util
		--disable-util-wallet
		--disable-bench
		--without-libs
		--without-daemon
		--without-gui
		--disable-fuzz
		--disable-fuzz-binary
		--disable-ccache
		--disable-static
	)

	econf "${myeconfargs[@]}"
}

src_install() {
	default

	newbashcomp contrib/bitcoin-cli.bash-completion ${PN}
}