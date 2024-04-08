# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION=" Private front-end for Reddit "
HOMEPAGE="https://github.com/redlib-org/redlib"
SRC_URI="https://github.com/redlib-org/redlib/tarball/e79242c9e7aefa4ec5d1281385beab2faa7447ce -> redlib-0.31.2-e79242c.tar.gz
https://direct.funtoo.org/97/ca/8b/97ca8b9c9bdff39b9da567bef9cb95f3e3de3e1484faf9dcff5567fecf9b5838822d628da5a4ded1351be5bfd849bd5918f8449e628c70555b27c9b1ee36f6bc -> redlib-0.31.2-funtoo-crates-bundle-bf9df7ad3467c78c0321a2c08ab4853e17017988656bd14890ea43d8eec024bf9ee95839847f6efe4e6024a344b7ca4212929d5525e6ab893ea3f38f91eedcfc.tar.gz"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="*"

DOCS=( README.md )

QA_FLAGS_IGNORED="/usr/bin/redlib"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/redlib-org-redlib-* ${S} || die
}