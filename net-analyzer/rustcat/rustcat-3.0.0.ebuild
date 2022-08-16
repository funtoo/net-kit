# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

CRATES="
atty-0.2.14
autocfg-1.1.0
bitflags-1.3.2
cfg-if-1.0.0
clap-3.2.17
clap_derive-3.2.17
clap_lex-0.2.4
clipboard-win-4.2.1
colored-1.9.3
colored-2.0.0
dirs-next-2.0.0
dirs-sys-next-0.1.2
endian-type-0.1.2
error-code-2.3.0
fd-lock-3.0.0
fern-0.6.1
getrandom-0.2.3
hashbrown-0.12.3
heck-0.4.0
hermit-abi-0.1.19
indexmap-1.9.1
lazy_static-1.4.0
libc-0.2.131
log-0.4.17
memchr-2.4.0
nibble_vec-0.1.0
nix-0.24.2
once_cell-1.13.0
os_str_bytes-6.2.0
proc-macro-error-1.0.4
proc-macro-error-attr-1.0.4
proc-macro2-1.0.43
quote-1.0.21
radix_trie-0.2.1
redox_syscall-0.2.8
redox_users-0.4.0
rustyline-10.0.0
scopeguard-1.1.0
signal-hook-0.3.14
signal-hook-registry-1.4.0
smallvec-1.6.1
str-buf-1.0.5
strsim-0.10.0
syn-1.0.99
termcolor-1.1.3
termios-0.3.3
textwrap-0.15.0
unicode-ident-1.0.3
unicode-segmentation-1.7.1
unicode-width-0.1.8
utf8parse-0.2.0
version_check-0.9.4
wasi-0.10.2+wasi-snapshot-preview1
winapi-0.3.9
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.5
winapi-x86_64-pc-windows-gnu-0.4.0
"

DESCRIPTION="Modern port listener & Reverse Shell"
HOMEPAGE="https://github.com/robiot/rustcat"
SRC_URI="https://api.github.com/repos/robiot/rustcat/tarball/v3.0.0 -> rustcat-3.0.0.tar.gz
	$(cargo_crate_uris ${CRATES})"
LICENSE="MIT"
SLOT="0"
KEYWORDS="*"
IUSE=""

post_src_unpack() {
	rm -rf "${S}"
	mv "${WORKDIR}"/robiot-rustcat-* "${S}" || die
}