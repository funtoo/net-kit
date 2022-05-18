# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit flag-o-matic toolchain-funcs

DESCRIPTION="Multipurpose relay (SOcket CAT)"
HOMEPAGE="http://www.dest-unreach.org/socat/ https://repo.or.cz/socat.git"
SRC_URI="http://www.dest-unreach.org/socat/download/socat-1.7.4.3.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="*"
IUSE="bindist ipv6 readline ssl tcpd"

DEPEND="
	ssl? ( dev-libs/openssl:0= )
	readline? ( sys-libs/readline:= )
	tcpd? ( sys-apps/tcp-wrappers )
"
RDEPEND="
	${DEPEND}
"

# Restrict test - Tests are a large bash script
# Hard to disable individual tests needing network or privileges
# in 1.7.4.2: FAILED:  59 329
RESTRICT="
	test 
	ssl? ( readline? ( bindist ) )
"

DOCS=( BUGREPORTS CHANGES DEVELOPMENT EXAMPLES FAQ FILES PORTING README SECURITY )

pkg_setup() {
	# bug #587740
	if use readline && use ssl ; then
		elog "You are enabling both readline and ssl (openssl) USE flags, the licenses"
		elog "for these packages conflict. You may not be able to legally"
		elog "redistribute the resulting binary."
	fi
}

src_configure() {
	#bug #293324
	filter-flags '-Wno-error*'
	tc-export AR

	# getprotobynumber_r doesn't exist on musl, so avoid probing for it
	# and possibly getting it wrong. TODO: fix configure?
	# (Grabbed from Alpine Linux: https://git.alpinelinux.org/aports/commit/main/socat/APKBUILD?id=5edc9195355ced3db991c1a7cda5648d52019b11)
	# bug #831016
	use elibc_musl && export sc_cv_getprotobynumber_r=2

	econf \
		$(use_enable ssl openssl) \
		$(use_enable readline) \
		$(use_enable ipv6 ip6) \
		$(use_enable tcpd libwrap)
}

src_install() {
	default

	docinto html
	dodoc doc/*.html doc/*.css
}