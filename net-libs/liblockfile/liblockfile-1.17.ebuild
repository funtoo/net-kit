# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools user

DESCRIPTION="Implements functions designed to lock the standard mailboxes"
HOMEPAGE="http://www.debian.org/"
SRC_URI="mirror://debian/pool/main/libl/${PN}/${PN}_${PV}.orig.tar.gz"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="*"
IUSE=""

DOCS=( Changelog README )

pkg_setup() {
	enewgroup mail 12
}

src_prepare() {
	default
	#sed -i -e 's:^\([a-z]*\)dir.*:\1dir = $(DESTDIR)/@\1dir@:g' ${S}/Makefile.in || die
	sed -i \
		-e 's:^libdir.*:libdir = $(DESTDIR)/@libdir@:g' \
		-e 's:^mandir.*:mandir = $(DESTDIR)/@mandir@:g' ${S}/Makefile.in || die
	eautoreconf
}

src_configure() {
	local grp=mail
	if use prefix ; then
		# we never want to use LDCONFIG
		export LDCONFIG=${EPREFIX}/bin/true
		# in unprivileged installs this is "mail"
		grp=$(id -g)
	fi

	local myeconfargs=(
		--with-mailgroup=${grp}
		--enable-shared
	)

	econf "${myeconfargs[@]}"
}

src_install() {
	addpredict /usr/share/man/man1/dotlockfile.1
	default
}
