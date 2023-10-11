# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson gnome3 readme.gentoo-r1 udev user vala

DESCRIPTION="Modem and mobile broadband management libraries"
HOMEPAGE="https://www.freedesktop.org/wiki/Software/ModemManager/"
SRC_URI="https://gitlab.freedesktop.org/mobile-broadband/ModemManager/-/archive/1.22.0/ModemManager-1.22.0.tar.bz2 -> ModemManager-1.22.0.tar.bz2"

LICENSE="GPL-2+"
SLOT="0/1" # subslot = dbus interface version, i.e. N in org.freedesktop.ModemManager${N}
KEYWORDS="*"

IUSE="elogind +introspection mbim policykit +qmi +qrtr +udev vala bash-completion"
REQUIRED_USE="
	qrtr? ( qmi )
	vala? ( introspection )
"
RESTRICT="test"

DEPEND="
	sys-apps/dbus
	>=dev-libs/glib-2.56.0:2
	udev? ( >=dev-libs/libgudev-232:= )
	introspection? ( >=dev-libs/gobject-introspection-0.9.6:= )
	mbim? ( >=net-libs/libmbim-1.29.2 )
	policykit? ( sys-auth/polkit[elogind?,introspection?] )
	qmi? ( >=net-libs/libqmi-1.33.2:=[qrtr?] )
	qrtr? ( >=net-libs/libqrtr-glib-1.0.0:= )
	elogind? ( sys-auth/elogind )
"
RDEPEND="${DEPEND}"
BDEPEND="
	dev-util/gdbus-codegen
	dev-util/glib-utils
	>=dev-util/gtk-doc-am-1
	>=sys-devel/gettext-0.19.8
	virtual/pkgconfig
	vala? ( $(vala_depend) )
"

S="${WORKDIR}/ModemManager-${PV}"

src_prepare() {
	use vala && vala_src_prepare
	gnome3_src_prepare
}

src_configure() {
		DOC_CONTENTS="
		If your USB modem shows up only as a storage device when you plug it in,
		then you should install sys-apps/usb_modeswitch, which will automatically
		switch it over to USB modem mode whenever you plug it in.\n"

	if use policykit; then
		enewgroup plugdev
		DOC_CONTENTS+="\nTo control your modem without needing to enter the root password,
			add your user account to the 'plugdev' group."
	fi



	local emesonargs=(
		-Ddist_version=\"${PVR}\"
		-Dsystemdsystemunitdir=$(usex elogind || echo "no")
		-Dpolkit=$(usex policykit "strict" "no")
		$(meson_use udev)
		$(meson_use introspection)
		$(meson_use mbim)
		$(meson_use elogind systemd_suspend_resume)
		$(meson_use elogind systemd_journal)
		$(meson_use qmi)
		$(meson_use qrtr)
		$(meson_use vala vapi)
		$(meson_use bash-completion bash_completion)
	)
	meson_src_configure
}

src_install() {
	meson_src_install

	# Allow users in plugdev group full control over their modem
	if use policykit; then
		insinto /usr/share/polkit-1/rules.d/
		doins "${FILESDIR}"/01-org.freedesktop.ModemManager1.rules
	fi

	readme.gentoo_create_doc

	newinitd "${FILESDIR}/modemmanager.initd" modemmanager
}

pkg_postinst() {
	gnome3_pkg_postinst

	# The polkit rules file moved to /usr/share
	old_rules="${EROOT}/etc/polkit-1/rules.d/01-org.freedesktop.ModemManager.rules"
	if [[ -f "${old_rules}" ]]; then
		case "$(md5sum ${old_rules})" in
		  c5ff02532cb1da2c7545c3069e5d0992* | 5c50f0dc603c0a56e2851a5ce9389335* )
			# Automatically delete the old rules.d file if the user did not change it
			elog
			elog "Removing old ${old_rules} ..."
			rm -f "${old_rules}" || eerror "Failed, please remove ${old_rules} manually"
			;;
		  * )
			elog "The ${old_rules}"
			elog "file moved to /usr/share/polkit-1/rules.d/ in >=modemmanager-0.5.2.0-r2"
			elog "If you edited ${old_rules}"
			elog "without changing its behavior, you may want to remove it."
			;;
		esac
	fi

	if ! use udev; then
		ewarn "You have built ModemManager without udev support. You may have to teach it"
		ewarn "about your modem port manually."
	fi

	use udev && udev_reload

	readme.gentoo_print_elog
}

pkg_postrm() {
	use udev && udev_reload
}