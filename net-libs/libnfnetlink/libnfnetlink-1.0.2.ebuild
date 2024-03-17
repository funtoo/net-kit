# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit linux-info

DESCRIPTION="The low-level library for netfilter related kernel/userspace communication"
HOMEPAGE="http://www.netfilter.org/projects/libnfnetlink/"
SRC_URI="https://www.netfilter.org/pub/libnfnetlink/libnfnetlink-1.0.2.tar.bz2 -> libnfnetlink-1.0.2.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="*"

pkg_setup() {
	linux-info_pkg_setup

	if kernel_is lt 2 6 18 ; then
		ewarn "${PN} requires at least 2.6.18 kernel version"
	fi

	#netfilter core team has changed some option names with kernel 2.6.20
	error_common=' is not set when it should be. You can activate it in the Core Netfilter Configuration'
	if kernel_is lt 2 6 20 ; then
		CONFIG_CHECK="~IP_NF_CONNTRACK_NETLINK"
		ERROR_IP_NF_CONNTRACK_NETLINK="CONFIG_IP_NF_CONNTRACK_NETLINK:\t${error_common}"
	else
		CONFIG_CHECK="~NF_CT_NETLINK"
		ERROR_NF_CT_NETLINK="CONFIG_NF_CT_NETLINK:\t${error_common}"
	fi

	check_extra_config
}

src_unpack() {
	default
}

src_install() {
	default

	# No static archives
	find "${ED}" -name '*.la' -delete || die
}

# vim: noet ts=4 syn=ebuild