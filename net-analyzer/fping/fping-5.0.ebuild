# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit fcaps

DESCRIPTION="A utility to ping multiple hosts at once"
HOMEPAGE="https://fping.org/ https://github.com/schweikert/fping/"
SRC_URI="https://github.com/schweikert/fping/tarball/03bfc48ff4674a94c9fb623612455456d7bf6458 -> fping-5.0-03bfc48.tar.gz"

LICENSE="fping"
SLOT="0"
KEYWORDS="*"
IUSE="suid"

FILECAPS=( cap_net_raw+ep usr/sbin/fping )


post_src_unpack() {
	if [ ! -d "${S}" ] ; then
		mv ${WORKDIR}/schweikert-* ${S} || die
	fi
}

src_prepare() {
	default
	./autogen.sh || die
}

src_configure() {
	econf --enable-ipv6
}

src_install() {
	default

	if use suid; then
		fperms u+s /usr/sbin/fping
	fi

	dosym fping /usr/sbin/fping6
}