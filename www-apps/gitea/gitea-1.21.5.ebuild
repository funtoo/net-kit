# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit fcaps go-module tmpfiles systemd flag-o-matic user

DESCRIPTION="A painless self-hosted Git service"
HOMEPAGE="https://gitea.com https://github.com/go-gitea/gitea"

SRC_URI="https://github.com/go-gitea/gitea/releases/download/v1.21.5/gitea-src-1.21.5.tar.gz -> gitea-src-1.21.5.tar.gz
https://direct.funtoo.org/1c/5c/93/1c5c930e10179768e38ef9000180bea9b657b6acd70bd2925f0419e9664507e5764d1424a5276bdf1b0f771c473ee9488a236fa7dea9e917f6e83e375a626f18 -> gitea-1.21.5-funtoo-go-bundle-cb298757329be1790dde286d5aae99f33040eeff58ece1c4ba0617b8ff200d287579bb357eaacdf2a5a7f0ef2fd6add7edd31205162d3ed9cbcdccb1d1679ee1.tar.gz"
KEYWORDS="*"
IUSE="systemd"

S="${WORKDIR}/${PN}-src-${PV}"

LICENSE="Apache-2.0 BSD BSD-2 CC0-1.0 ISC MIT MPL-2.0"
SLOT="0"

DEPEND="sys-libs/pam"
RDEPEND="${DEPEND}
	dev-vcs/git"
BDEPEND=">=dev-lang/go-1.21:="

DOCS=(
	custom/conf/app.example.ini CHANGELOG.md CONTRIBUTING.md README.md
)
FILECAPS=(
	-m 711 cap_net_bind_service+ep usr/bin/gitea
)

pkg_setup() {
	enewgroup git
	enewuser git -1 /bin/bash /var/lib/gitea git
}

src_prepare() {
	default

	sed -i -e "s#^MODE = console#MODE = file#" custom/conf/app.example.ini || die
}

src_configure() {
	# bug 832756 - PIE build issues
	filter-flags -fPIE
	filter-ldflags -fPIE -pie
}

src_compile() {
	local gitea_tags
	local -a gitea_settings makeenv

	gitea_tags="bindata,pam,sqlite,sqlite_unlock_notify"

	gitea_settings=(
		"-X code.gitea.io/gitea/modules/setting.CustomConf=${EPREFIX}/etc/gitea/app.ini"
		"-X code.gitea.io/gitea/modules/setting.CustomPath=${EPREFIX}/var/lib/gitea/custom"
		"-X code.gitea.io/gitea/modules/setting.AppWorkPath=${EPREFIX}/var/lib/gitea"
	)

	makeenv=(
		LDFLAGS="-extldflags \"${LDFLAGS}\" ${gitea_settings[*]}"
		TAGS="${gitea_tags}"
	)

	# Use variable STORED_VERSION_FILE (the "${S}/VERSION" file) to set version,
	# and prevent executing git command when it's not a live version.
	makeenv+=( GITHUB_REF_NAME="" )

	env "${makeenv[@]}" emake backend
}

src_install() {
	dobin gitea

	einstalldocs

	newconfd "${FILESDIR}/gitea.confd-r1" gitea
	if use systemd ; then
		systemd_newunit "${FILESDIR}"/gitea.service-r4 gitea.service
	else
		newinitd "${FILESDIR}/gitea.initd-r3" gitea
	fi

	newtmpfiles - gitea.conf <<-EOF
		d /run/gitea 0755 git git
	EOF

	insinto /etc/gitea
	newins custom/conf/app.example.ini app.ini
	fowners root:git /etc/gitea/{,app.ini}
	fperms g+w,o-rwx /etc/gitea/{,app.ini}

	diropts -m0750 -o git -g git
	keepdir /var/lib/gitea /var/lib/gitea/custom /var/lib/gitea/data
	keepdir /var/log/gitea
}

pkg_postinst() {
	fcaps_pkg_postinst
	tmpfiles_process gitea.conf
}