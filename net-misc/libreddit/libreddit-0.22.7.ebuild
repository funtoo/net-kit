# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="
aho-corasick-0.7.18
askama-0.11.1
askama_derive-0.11.2
askama_escape-0.10.3
askama_shared-0.12.2
async-recursion-1.0.0
async-trait-0.1.53
async_once-0.2.6
autocfg-1.1.0
base64-0.13.0
bitflags-1.3.2
bumpalo-3.9.1
bytes-1.1.0
cached-0.34.0
cached_proc_macro-0.12.0
cached_proc_macro_types-0.1.0
cc-1.0.73
cfg-if-1.0.0
clap-3.1.18
clap_lex-0.2.0
cookie-0.16.0
core-foundation-0.9.3
core-foundation-sys-0.8.3
darling-0.13.4
darling_core-0.13.4
darling_macro-0.13.4
fastrand-1.7.0
fnv-1.0.7
form_urlencoded-1.0.1
futures-0.3.21
futures-channel-0.3.21
futures-core-0.3.21
futures-executor-0.3.21
futures-io-0.3.21
futures-lite-1.12.0
futures-macro-0.3.21
futures-sink-0.3.21
futures-task-0.3.21
futures-util-0.3.21
h2-0.3.13
hashbrown-0.11.2
hashbrown-0.12.1
hermit-abi-0.1.19
http-0.2.7
http-body-0.4.4
httparse-1.7.1
httpdate-1.0.2
hyper-0.14.18
hyper-rustls-0.23.0
ident_case-1.0.1
idna-0.2.3
indexmap-1.8.1
instant-0.1.12
itoa-1.0.1
js-sys-0.3.57
lazy_static-1.4.0
libc-0.2.125
lock_api-0.4.7
log-0.4.17
matches-0.1.9
memchr-2.5.0
mime-0.3.16
mime_guess-2.0.4
minimal-lexical-0.2.1
mio-0.8.3
nom-7.1.1
num_cpus-1.13.1
num_threads-0.1.6
once_cell-1.10.0
openssl-probe-0.1.5
os_str_bytes-6.0.1
parking-2.0.0
parking_lot-0.12.0
parking_lot_core-0.9.3
percent-encoding-2.1.0
pin-project-lite-0.2.9
pin-utils-0.1.0
proc-macro2-1.0.38
quote-1.0.18
redox_syscall-0.2.13
regex-1.5.5
regex-syntax-0.6.25
ring-0.16.20
route-recognizer-0.3.1
rustls-0.20.5
rustls-native-certs-0.6.2
rustls-pemfile-1.0.0
ryu-1.0.9
schannel-0.1.19
scopeguard-1.1.0
sct-0.7.0
security-framework-2.6.1
security-framework-sys-2.6.1
serde-1.0.137
serde_derive-1.0.137
serde_json-1.0.81
signal-hook-registry-1.4.0
slab-0.4.6
smallvec-1.8.0
socket2-0.4.4
spin-0.5.2
strsim-0.10.0
syn-1.0.94
textwrap-0.15.0
thiserror-1.0.31
thiserror-impl-1.0.31
time-0.3.9
time-macros-0.2.4
tinyvec-1.6.0
tinyvec_macros-0.1.0
tokio-1.18.2
tokio-macros-1.7.0
tokio-rustls-0.23.4
tokio-util-0.7.2
tower-service-0.3.1
tracing-0.1.34
tracing-attributes-0.1.21
tracing-core-0.1.26
try-lock-0.2.3
unicase-2.6.0
unicode-bidi-0.3.8
unicode-normalization-0.1.19
unicode-xid-0.2.3
untrusted-0.7.1
url-2.2.2
version_check-0.9.4
waker-fn-1.1.0
want-0.3.0
wasi-0.11.0+wasi-snapshot-preview1
wasm-bindgen-0.2.80
wasm-bindgen-backend-0.2.80
wasm-bindgen-macro-0.2.80
wasm-bindgen-macro-support-0.2.80
wasm-bindgen-shared-0.2.80
web-sys-0.3.57
webpki-0.22.0
winapi-0.3.9
winapi-i686-pc-windows-gnu-0.4.0
winapi-x86_64-pc-windows-gnu-0.4.0
windows-sys-0.36.1
windows_aarch64_msvc-0.36.1
windows_i686_gnu-0.36.1
windows_i686_msvc-0.36.1
windows_x86_64_gnu-0.36.1
windows_x86_64_msvc-0.36.1
"

inherit cargo

DESCRIPTION="An alternative private front-end to Reddit"
HOMEPAGE="https://github.com/spikecodes/libreddit"
SRC_URI="https://api.github.com/repos/spikecodes/libreddit/tarball/v0.22.7 -> libreddit-v0.22.7.tar.gz
	$(cargo_crate_uris ${CRATES})"

LICENSE="GPL3"
SLOT="0"
KEYWORDS="*"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/spikecodes-libreddit-* ${S} || die
}

src_install() {
	cargo_src_install

	dodoc README.md
}