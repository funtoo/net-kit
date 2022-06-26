# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit linux-info bash-completion-r1 systemd toolchain-funcs

DESCRIPTION="Required tools for WireGuard, such as wg(8) and wg-quick(8)"
HOMEPAGE="https://www.wireguard.com/"

SRC_URI="https://github.com/WireGuard/wireguard-tools/tarball/3ba6527130c502144e7388b900138bca6260f4e8 -> wireguard-tools-1.0.20210914-3ba6527.tar.gz"

KEYWORDS="*"

LICENSE="GPL-2"
SLOT="0"
IUSE="selinux"

BDEPEND="virtual/pkgconfig"
DEPEND=""
RDEPEND="${DEPEND}
	selinux? ( sec-policy/selinux-wireguard )
"

post_src_unpack() {
	if [ ! -d "${S}" ] ; then
		mv ${WORKDIR}/WireGuard-* ${S} || die
	fi
}

pkg_setup() {
	get_version
	if [[ -f $KERNEL_DIR/include/uapi/linux/wireguard.h ]]; then
		CONFIG_CHECK="~WIREGUARD $CONFIG_CHECK"
		declare -g ERROR_WIREGUARD="CONFIG_WIREGUARD: This option is required for using WireGuard."
	elif kernel_is -ge 3 10 0 && kernel_is -lt 5 6 0 && ! has_version sys-kernel/debian-sources; then
		ewarn
		ewarn "Your kernel does not appear to have upstream support for WireGuard"
		ewarn "via CONFIG_WIREGUARD. However, the default Funtoo Linux kernel ebuild"
		ewarn "contains a module that should work for you."
		ewarn "It is highly recommended to install it:"
		ewarn
		ewarn "    emerge -av sys-kernel/debian-sources"
		ewarn
	fi
	linux-info_pkg_setup
}

src_compile() {
	emake RUNSTATEDIR="${EPREFIX}/run" -C src CC="$(tc-getCC)" LD="$(tc-getLD)"
}

src_install() {
	dodoc README.md
	dodoc -r contrib
	emake \
		WITH_BASHCOMPLETION=yes \
		WITH_SYSTEMDUNITS=yes \
		WITH_WGQUICK=yes \
		DESTDIR="${D}" \
		BASHCOMPDIR="$(get_bashcompdir)" \
		SYSTEMDUNITDIR="$(systemd_get_systemunitdir)" \
		PREFIX="${EPREFIX}/usr" \
		-C src install
}
