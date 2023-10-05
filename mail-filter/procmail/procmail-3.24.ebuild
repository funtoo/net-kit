# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit flag-o-matic toolchain-funcs

DESCRIPTION="Mail delivery agent/filter"
HOMEPAGE="http://www.procmail.org/"
SRC_URI="https://github.com/BuGlessRB/procmail/tarball/07e769f07102767242edf835e995db6646bba373 -> procmail-3.24-07e769f.tar.gz"

LICENSE="|| ( Artistic GPL-2 )"
SLOT="0"
KEYWORDS="*"
IUSE="mbox selinux"

DEPEND="virtual/mta"
RDEPEND="selinux? ( sec-policy/selinux-procmail )"

S="${WORKDIR}/BuGlessRB-procmail-07e769f"

src_prepare() {
	if ! use mbox ; then
		echo "# Use maildir-style mailbox in user's home directory" > "${S}"/procmailrc || die
		echo 'DEFAULT=$HOME/.maildir/' >> "${S}"/procmailrc || die
		eapply -p1 "${FILESDIR}"/3.24-default-home-maildir.patch
		cd "${S}" || die
	else
		echo '# Use mbox-style mailbox in /var/spool/mail' > "${S}"/procmailrc || die
		echo 'DEFAULT=${EPREFIX}/var/spool/mail/$LOGNAME' >> "${S}"/procmailrc || die
	fi
	# Do not use lazy bindings on lockfile and procmail
	if [[ ${CHOST} != *-darwin* ]]; then
		eapply -p0 "${FILESDIR}"/3.24-disable-lazy-bindings.patch
	fi
	eprefixify config.h Makefile src/autoconf src/recommend.c

	eapply_user
}

src_compile() {
	# -finline-functions (implied by -O3) leaves strstr() in an infinite loop.
	# To work around this, we append -fno-inline-functions to CFLAGS
	# Since GCC 4.7 we also need -fno-ipa-cp-clone (bug #466552)
	# If it's clang, ignore -fno-ipa-cp-clone, as clang doesn't support this
	case "$(tc-getCC)" in
		"clang") append-flags -fno-inline-functions ;;
		"gcc"|*) append-flags -fno-inline-functions -fno-ipa-cp-clone ;;
	esac

	sed -e "s:CFLAGS0 = -O:CFLAGS0 = ${CFLAGS}:" \
		-e "s:LDFLAGS0= -s:LDFLAGS0 = ${LDFLAGS}:" \
		-e "s:LOCKINGTEST=__defaults__:#LOCKINGTEST=__defaults__:" \
		-e "s:#LOCKINGTEST=/tmp:LOCKINGTEST=/tmp:" \
		-i Makefile || die "sed failed"

	emake CC="$(tc-getCC)"
}

src_install() {
	cd "${S}"/new || die
	insinto /usr/bin
	doins procmail

	doins lockfile
	fowners root:mail /usr/bin/lockfile

	dobin formail mailstat
	insopts -m 0644

	doman *.1 *.5

	cd "${S}" || die
	dodoc FAQ FEATURES HISTORY INSTALL KNOWN_BUGS README

	insinto /etc
	doins procmailrc

	docinto examples
	dodoc examples/*
}

pkg_postinst() {
	# workaround permission mangle by FEATURES="sfperms" during install phase. https://bugs.funtoo.org/browse/FL-3946
	chmod 6755 /usr/bin/procmail
	chmod 2755 /usr/bin/lockfile

	if ! use mbox ; then
		elog "Starting with mail-filter/procmail-3.22-r9 you'll need to ensure"
		elog "that you configure a mail storage location using DEFAULT in"
		elog "/etc/procmailrc, for example:"
		elog "\tDEFAULT=\$HOME/.maildir/"
	fi
}