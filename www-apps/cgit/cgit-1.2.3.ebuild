# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3+ )

WEBAPP_MANUAL_SLOT="yes"

inherit python-single-r1 toolchain-funcs user webapp

[[ -z "${CGIT_CACHEDIR}" ]] && CGIT_CACHEDIR="/var/cache/${PN}/"

DESCRIPTION="a fast web-interface for git repositories"
HOMEPAGE="https://git.zx2c4.com/cgit/about"
SRC_URI="
	https://git.zx2c4.com/cgit/snapshot/cgit-1.2.3.tar.xz -> cgit-1.2.3.tar.xz
	https://www.kernel.org/pub/software/scm/git/git-2.25.1.tar.xz -> git-2.25.1.tar.xz
"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="*"
IUSE="doc +highlight +lua +jit"

RESTRICT="test"

RDEPEND="${PYTHON_DEPS}
	dev-libs/openssl:0=
	dev-vcs/git
	sys-libs/zlib
	virtual/httpd-cgi
	highlight? ( || ( dev-python/pygments app-text/highlight ) )
	lua? ( jit? ( dev-lang/luajit ) !jit? ( dev-lang/lua ) )
"
# ebuilds without WEBAPP_MANUAL_SLOT="yes" are broken
DEPEND="${RDEPEND}
	!<www-apps/cgit-0.8.3.3
	doc? ( app-text/docbook-xsl-stylesheets
		>=app-text/asciidoc-8.5.1 )
"

pkg_setup() {
	webapp_pkg_setup
	enewuser "${PN}"
	enewgroup "${PN}"
}

src_prepare() {
	python_setup

	rmdir git || die
	mv "${WORKDIR}"/git-2.25.1 git || die

	echo "prefix = ${EPREFIX}/usr" >> cgit.conf || die "echo prefix failed"
	echo "libdir = ${EPREFIX}/usr/$(get_libdir)" >> cgit.conf || die "echo libdir failed"
	echo "CGIT_SCRIPT_PATH = ${MY_CGIBINDIR}" >> cgit.conf || die "echo CGIT_SCRIPT_PATH failed"
	echo "CGIT_DATA_PATH = ${MY_HTDOCSDIR}" >> cgit.conf || die "echo CGIT_DATA_PATH failed"
	echo "CACHE_ROOT = ${CGIT_CACHEDIR}" >> cgit.conf || die "echo CACHE_ROOT failed"
	echo "DESTDIR = ${D}" >> cgit.conf || die "echo DESTDIR failed"
	if use lua; then
		if use jit; then
			echo "LUA_PKGCONFIG = luajit" >> cgit.conf || die "echo LUA_PKGCONFIG failed"
		else
			echo "LUA_PKGCONFIG = lua" >> cgit.conf || die "echo LUA_PKGCONFIG failed"
		fi
	else
		echo "NO_LUA = 1" >> cgit.conf || die "echo NO_LUA failed"
	fi

	eapply_user
}

src_compile() {
	emake V=1 AR="$(tc-getAR)" CC="$(tc-getCC)" CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}"
	use doc && emake V=1 doc-man
}

src_install() {
	webapp_src_preinst

	emake V=1 AR="$(tc-getAR)" CC="$(tc-getCC)" CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}" install

	insinto /etc
	doins "${FILESDIR}"/cgitrc

	dodoc README
	use doc && doman cgitrc.5

	webapp_postinst_txt en "${FILESDIR}"/postinstall-en.txt
	webapp_src_install

	keepdir "${CGIT_CACHEDIR}"
	fowners ${PN}:${PN} "${CGIT_CACHEDIR}"
	fperms 700 "${CGIT_CACHEDIR}"
	python_fix_shebang .
}

pkg_postinst() {
	webapp_pkg_postinst
	ewarn "If you intend to run cgit using web server's user"
	ewarn "you should change ${CGIT_CACHEDIR} permissions."
}