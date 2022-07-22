# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

EGO_SUM=(
	"github.com/!adhitya!ramadhanus/fasthttpcors v0.0.0-20170121111917-d4c07198763a"
	"github.com/!adhitya!ramadhanus/fasthttpcors v0.0.0-20170121111917-d4c07198763a/go.mod"
	"github.com/!burnt!sushi/toml v0.3.1"
	"github.com/!burnt!sushi/toml v0.3.1/go.mod"
	"github.com/alecthomas/units v0.0.0-20210208195552-ff826a37aa15"
	"github.com/alecthomas/units v0.0.0-20210208195552-ff826a37aa15/go.mod"
	"github.com/andybalholm/brotli v1.0.4"
	"github.com/andybalholm/brotli v1.0.4/go.mod"
	"github.com/beorn7/perks v1.0.1"
	"github.com/beorn7/perks v1.0.1/go.mod"
	"github.com/davecgh/go-spew v1.1.0/go.mod"
	"github.com/davecgh/go-spew v1.1.1"
	"github.com/davecgh/go-spew v1.1.1/go.mod"
	"github.com/go-echarts/go-echarts/v2 v2.2.4"
	"github.com/go-echarts/go-echarts/v2 v2.2.4/go.mod"
	"github.com/klauspost/compress v1.15.0"
	"github.com/klauspost/compress v1.15.0/go.mod"
	"github.com/kr/pretty v0.1.0"
	"github.com/kr/pretty v0.1.0/go.mod"
	"github.com/kr/pty v1.1.1/go.mod"
	"github.com/kr/text v0.1.0"
	"github.com/kr/text v0.1.0/go.mod"
	"github.com/mattn/go-isatty v0.0.14"
	"github.com/mattn/go-isatty v0.0.14/go.mod"
	"github.com/mattn/go-runewidth v0.0.13"
	"github.com/mattn/go-runewidth v0.0.13/go.mod"
	"github.com/nicksnyder/go-i18n v1.10.1"
	"github.com/nicksnyder/go-i18n v1.10.1/go.mod"
	"github.com/pelletier/go-toml v1.2.0"
	"github.com/pelletier/go-toml v1.2.0/go.mod"
	"github.com/pmezard/go-difflib v1.0.0"
	"github.com/pmezard/go-difflib v1.0.0/go.mod"
	"github.com/prashantv/gostub v1.1.0"
	"github.com/rivo/uniseg v0.2.0"
	"github.com/rivo/uniseg v0.2.0/go.mod"
	"github.com/stretchr/objx v0.1.0/go.mod"
	"github.com/stretchr/testify v1.4.0/go.mod"
	"github.com/stretchr/testify v1.6.0/go.mod"
	"github.com/stretchr/testify v1.7.1"
	"github.com/valyala/bytebufferpool v1.0.0"
	"github.com/valyala/bytebufferpool v1.0.0/go.mod"
	"github.com/valyala/fasthttp v1.38.0"
	"github.com/valyala/fasthttp v1.38.0/go.mod"
	"github.com/valyala/tcplisten v1.0.0/go.mod"
	"go.uber.org/automaxprocs v1.5.1"
	"go.uber.org/automaxprocs v1.5.1/go.mod"
	"golang.org/x/crypto v0.0.0-20220214200702-86341886e292/go.mod"
	"golang.org/x/net v0.0.0-20211112202133-69e39bad7dc2/go.mod"
	"golang.org/x/net v0.0.0-20220225172249-27dd8689420f"
	"golang.org/x/net v0.0.0-20220225172249-27dd8689420f/go.mod"
	"golang.org/x/sys v0.0.0-20201119102817-f84b799fce68/go.mod"
	"golang.org/x/sys v0.0.0-20210423082822-04245dca01da/go.mod"
	"golang.org/x/sys v0.0.0-20210615035016-665e8c7367d1/go.mod"
	"golang.org/x/sys v0.0.0-20210630005230-0f9fa26af87c/go.mod"
	"golang.org/x/sys v0.0.0-20211216021012-1d35b9e2eb4e/go.mod"
	"golang.org/x/sys v0.0.0-20220227234510-4e6760a101f9"
	"golang.org/x/sys v0.0.0-20220227234510-4e6760a101f9/go.mod"
	"golang.org/x/term v0.0.0-20201126162022-7de9c90e9dd1/go.mod"
	"golang.org/x/term v0.0.0-20210927222741-03fcf44c2211/go.mod"
	"golang.org/x/text v0.3.6/go.mod"
	"golang.org/x/text v0.3.7"
	"golang.org/x/text v0.3.7/go.mod"
	"golang.org/x/time v0.0.0-20220411224347-583f2d630306"
	"golang.org/x/time v0.0.0-20220411224347-583f2d630306/go.mod"
	"golang.org/x/tools v0.0.0-20180917221912-90fa682c2a6e/go.mod"
	"gopkg.in/alecthomas/kingpin.v3-unstable v3.0.0-20191105091915-95d230a53780"
	"gopkg.in/alecthomas/kingpin.v3-unstable v3.0.0-20191105091915-95d230a53780/go.mod"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod"
	"gopkg.in/check.v1 v1.0.0-20180628173108-788fd7840127/go.mod"
	"gopkg.in/check.v1 v1.0.0-20190902080502-41f04d3bba15"
	"gopkg.in/check.v1 v1.0.0-20190902080502-41f04d3bba15/go.mod"
	"gopkg.in/yaml.v2 v2.2.1/go.mod"
	"gopkg.in/yaml.v2 v2.2.2/go.mod"
	"gopkg.in/yaml.v2 v2.4.0"
	"gopkg.in/yaml.v2 v2.4.0/go.mod"
	"gopkg.in/yaml.v3 v3.0.0-20200313102051-9f266ea9e77c/go.mod"
	"gopkg.in/yaml.v3 v3.0.0-20210107192922-496545a6307b"
)

go-module_set_globals

DESCRIPTION="HTTP(S) benchmarking tool, written in Golang"
HOMEPAGE="https://github.com/six-ddc/plow"
SRC_URI="https://api.github.com/repos/six-ddc/plow/tarball/v1.3.0 -> plow-1.3.0.tar.gz
	${EGO_SUM_SRC_URI}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"

src_unpack() {
	go-module_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/six-ddc-plow-* ${S} || die
}

src_compile() {
	go build -mod=mod . || die "compile failed"
}

src_install() {
	dobin ${PN}
	dodoc README.md
}