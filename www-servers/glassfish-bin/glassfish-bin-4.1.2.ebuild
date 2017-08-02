# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit eutils user

DESCRIPTION="GlassFish Server Open Source Edition"
HOMEPAGE="https://javaee.github.io/glassfish/"
LICENSE="|| ( CDDL GPL-2 )"
SRC_URI="http://download.java.net/glassfish/4.1.2/release/glassfish-4.1.2.zip
	update-tool? ( http://download.oracle.com/glassfish/4.1.2/nightly/glassfish-4.1.2-b03-02_25_2017.zip )"

SLOT="0"
KEYWORDS="x86 amd64"
IUSE="update-tool"

RDEPEND=">=virtual/jdk-1.7"

S="${WORKDIR}/glassfish4"
INSTALL_DIR="/opt/${PN}"

pkg_setup() {

	enewgroup glassfish
	enewuser glassfish -1 /bin/bash ${INSTALL_DIR}/home glassfish

}

src_unpack() {

	if use update-tool ; then
		# Update tool was excluded from the released 4.1.2 version
		# for some unknown reason so we must extract it from a
		# pre-released version.
		unpack glassfish-4.1.2-b03-02_25_2017.zip
		mv ${S} ${WORKDIR}/glassfish-b03
		unpack glassfish-4.1.2.zip
		mv ${WORKDIR}/glassfish-b03/pkg ${S}/pkg
	else
		unpack glassfish-4.1.2.zip
	fi

}

src_prepare() {

	find . \( -name \*.bat -or -name \*.exe \) -delete

}

src_install() {
	insinto ${INSTALL_DIR}

	if use update-tool ; then
		doins -r bin glassfish javadb mq pkg
	else
		doins -r bin glassfish javadb mq
	fi

	keepdir ${INSTALL_DIR}/home

	for i in bin/* ; do
		fperms 755 ${INSTALL_DIR}/${i}
		make_wrapper "gf-$(basename ${i})" "${INSTALL_DIR}/${i}"
	done

	for i in glassfish/bin/* ; do
		fperms 755 ${INSTALL_DIR}/${i}
	done

	for i in mq/bin/* ; do
		fperms 755 ${INSTALL_DIR}/${i}
	done

	# Install our own openrc init scripts
	newinitd "${FILESDIR}/imqbroker.init" imqbroker
	newconfd "${FILESDIR}/imqbroker.conf" imqbroker
	newinitd "${FILESDIR}/glassfish.init" glassfish
	newconfd "${FILESDIR}/glassfish.conf" glassfish

	# Domain directory needs to be group writable
	keepdir ${INSTALL_DIR}/glassfish/domains
	fperms -R g+w "${INSTALL_DIR}/glassfish/domains"

	# Default directory for MQ. Create now so we can set permissions
	dodir /var/imq
	keepdir /var/imq
	fperms 770 /var/imq
	fowners glassfish:glassfish /var/imq

	# Change default in imqenv.conf to use /var/imq
	sed -i '/^IMQ_DEFAULT_VARHOME=/c\IMQ_DEFAULT_VARHOME=/var/imq' ${ED}${INSTALL_DIR}/mq/etc/imqenv.conf
	fowners -R glassfish:glassfish ${INSTALL_DIR}

	echo "CONFIG_PROTECT=\"${INSTALL_DIR}/glassfish/config\"" > "${T}/25glassfish"
	doenvd "${T}/25glassfish"
}

pkg_postinst() {
	elog "You must be in the glassfish group to use GlassFish without root privileges."
	elog "A default user 'glassfish' has been created. It is recommended (but not required)"
	elog "to use this user for running glassfish."
	elog "Attempting to use multiple users for the same domain will most likely"
	elog "result in failures due to permission problems"
	elog ""
	elog "Please note that the wrappers in /usr/bin for asadmin, pkg, and updatetool"
	elog "have the names gf-asadmin, gf-pkg, gf-updatetool to avoid file collisions"
	elog "with other packages that use the same names"

 }
