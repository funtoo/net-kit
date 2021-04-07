# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="
aho-corasick-0.7.15
arrayvec-0.5.2
askama-0.10.5
askama_derive-0.10.5
askama_escape-0.10.1
askama_shared-0.11.1
async-mutex-1.4.0
async-recursion-0.3.2
async-trait-0.1.48
autocfg-1.0.1
base-x-0.2.8
base64-0.13.0
bitflags-1.2.1
bitvec-0.19.5
bumpalo-3.6.1
bytes-1.0.1
cached-0.23.0
cached_proc_macro-0.6.0
cached_proc_macro_types-0.1.0
cc-1.0.67
cfg-if-1.0.0
clap-2.33.3
const_fn-0.4.6
cookie-0.15.0
core-foundation-0.9.1
core-foundation-sys-0.8.2
ct-logs-0.8.0
darling-0.10.2
darling_core-0.10.2
darling_macro-0.10.2
discard-1.0.4
event-listener-2.5.1
fastrand-1.4.0
fnv-1.0.7
form_urlencoded-1.0.1
funty-1.1.0
futures-0.3.13
futures-channel-0.3.13
futures-core-0.3.13
futures-executor-0.3.13
futures-io-0.3.13
futures-lite-1.11.3
futures-macro-0.3.13
futures-sink-0.3.13
futures-task-0.3.13
futures-util-0.3.13
h2-0.3.2
hashbrown-0.9.1
hermit-abi-0.1.18
http-0.2.4
http-body-0.4.1
httparse-1.3.6
httpdate-0.3.2
hyper-0.14.5
hyper-rustls-0.22.1
ident_case-1.0.1
idna-0.2.2
indexmap-1.6.2
instant-0.1.9
itoa-0.4.7
js-sys-0.3.50
lazy_static-1.4.0
lexical-core-0.7.5
libc-0.2.93
lock_api-0.4.3
log-0.4.14
matches-0.1.8
memchr-2.3.4
mio-0.7.11
miow-0.3.7
nom-6.1.2
ntapi-0.3.6
num_cpus-1.13.0
once_cell-1.7.2
openssl-probe-0.1.2
parking-2.0.0
parking_lot-0.11.1
parking_lot_core-0.8.3
percent-encoding-2.1.0
pin-project-1.0.6
pin-project-internal-1.0.6
pin-project-lite-0.2.6
pin-utils-0.1.0
proc-macro-hack-0.5.19
proc-macro-nested-0.1.7
proc-macro2-1.0.26
quote-1.0.9
radium-0.5.3
redox_syscall-0.2.5
regex-1.4.5
regex-syntax-0.6.23
ring-0.16.20
route-recognizer-0.3.0
rustc_version-0.2.3
rustls-0.19.0
rustls-native-certs-0.5.0
ryu-1.0.5
schannel-0.1.19
scopeguard-1.1.0
sct-0.6.0
security-framework-2.2.0
security-framework-sys-2.2.0
semver-0.9.0
semver-parser-0.7.0
serde-1.0.125
serde_derive-1.0.125
serde_json-1.0.64
sha1-0.6.0
signal-hook-registry-1.3.0
slab-0.4.2
smallvec-1.6.1
socket2-0.4.0
spin-0.5.2
standback-0.2.17
static_assertions-1.1.0
stdweb-0.4.20
stdweb-derive-0.5.3
stdweb-internal-macros-0.2.9
stdweb-internal-runtime-0.1.5
strsim-0.9.3
syn-1.0.68
tap-1.0.1
textwrap-0.11.0
time-0.2.26
time-macros-0.1.1
time-macros-impl-0.1.1
tinyvec-1.2.0
tinyvec_macros-0.1.0
tokio-1.4.0
tokio-macros-1.1.0
tokio-rustls-0.22.0
tokio-util-0.6.5
tower-service-0.3.1
tracing-0.1.25
tracing-core-0.1.17
try-lock-0.2.3
unicode-bidi-0.3.5
unicode-normalization-0.1.17
unicode-width-0.1.8
unicode-xid-0.2.1
untrusted-0.7.1
url-2.2.1
version_check-0.9.3
waker-fn-1.1.0
want-0.3.0
wasm-bindgen-0.2.73
wasm-bindgen-backend-0.2.73
wasm-bindgen-macro-0.2.73
wasm-bindgen-macro-support-0.2.73
wasm-bindgen-shared-0.2.73
web-sys-0.3.50
webpki-0.21.4
winapi-0.3.9
winapi-i686-pc-windows-gnu-0.4.0
winapi-x86_64-pc-windows-gnu-0.4.0
wyz-0.2.0
"

inherit cargo

DESCRIPTION="An alternative private front-end to Reddit"
HOMEPAGE="https://github.com/spikecodes/libreddit"
SRC_URI="https://api.github.com/repos/spikecodes/libreddit/tarball/v0.10.0 -> libreddit-v0.10.0.tar.gz
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