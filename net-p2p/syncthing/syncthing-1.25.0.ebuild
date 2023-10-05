# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop go-module user xdg-utils

EGO_SUM=(
	"github.com/!audrius!butkevicius/recli v0.0.7-0.20220911121932-d000ce8fbf0f"
	"github.com/!audrius!butkevicius/recli v0.0.7-0.20220911121932-d000ce8fbf0f/go.mod"
	"github.com/!azure/go-ntlmssp v0.0.0-20221128193559-754e69321358"
	"github.com/!azure/go-ntlmssp v0.0.0-20221128193559-754e69321358/go.mod"
	"github.com/!burnt!sushi/toml v1.3.2/go.mod"
	"github.com/alecthomas/assert/v2 v2.1.0"
	"github.com/alecthomas/kong v0.8.0"
	"github.com/alecthomas/kong v0.8.0/go.mod"
	"github.com/alecthomas/repr v0.1.0"
	"github.com/alexbrainman/sspi v0.0.0-20210105120005-909beea2cc74"
	"github.com/alexbrainman/sspi v0.0.0-20210105120005-909beea2cc74/go.mod"
	"github.com/beorn7/perks v1.0.1"
	"github.com/beorn7/perks v1.0.1/go.mod"
	"github.com/calmh/glob v0.0.0-20220615080505-1d823af5017b"
	"github.com/calmh/glob v0.0.0-20220615080505-1d823af5017b/go.mod"
	"github.com/calmh/incontainer v0.0.0-20221224152218-b3e71b103d7a"
	"github.com/calmh/incontainer v0.0.0-20221224152218-b3e71b103d7a/go.mod"
	"github.com/calmh/xdr v1.1.0"
	"github.com/calmh/xdr v1.1.0/go.mod"
	"github.com/ccding/go-stun v0.1.4"
	"github.com/ccding/go-stun v0.1.4/go.mod"
	"github.com/certifi/gocertifi v0.0.0-20210507211836-431795d63e8d"
	"github.com/certifi/gocertifi v0.0.0-20210507211836-431795d63e8d/go.mod"
	"github.com/cespare/xxhash/v2 v2.2.0"
	"github.com/cespare/xxhash/v2 v2.2.0/go.mod"
	"github.com/chmduquesne/rollinghash v4.0.0+incompatible"
	"github.com/chmduquesne/rollinghash v4.0.0+incompatible/go.mod"
	"github.com/chzyer/logex v1.1.10/go.mod"
	"github.com/chzyer/readline v0.0.0-20180603132655-2972be24d48e/go.mod"
	"github.com/chzyer/test v0.0.0-20180213035817-a1ea475d72b1/go.mod"
	"github.com/cpuguy83/go-md2man/v2 v2.0.2"
	"github.com/cpuguy83/go-md2man/v2 v2.0.2/go.mod"
	"github.com/d4l3k/messagediff v1.2.1"
	"github.com/d4l3k/messagediff v1.2.1/go.mod"
	"github.com/davecgh/go-spew v1.1.0/go.mod"
	"github.com/davecgh/go-spew v1.1.1"
	"github.com/davecgh/go-spew v1.1.1/go.mod"
	"github.com/flynn-archive/go-shlex v0.0.0-20150515145356-3f9db97f8568"
	"github.com/flynn-archive/go-shlex v0.0.0-20150515145356-3f9db97f8568/go.mod"
	"github.com/fsnotify/fsnotify v1.4.7/go.mod"
	"github.com/fsnotify/fsnotify v1.4.9/go.mod"
	"github.com/fsnotify/fsnotify v1.5.4"
	"github.com/fsnotify/fsnotify v1.5.4/go.mod"
	"github.com/getsentry/raven-go v0.2.0"
	"github.com/getsentry/raven-go v0.2.0/go.mod"
	"github.com/go-asn1-ber/asn1-ber v1.5.5"
	"github.com/go-asn1-ber/asn1-ber v1.5.5/go.mod"
	"github.com/go-ldap/ldap/v3 v3.4.6"
	"github.com/go-ldap/ldap/v3 v3.4.6/go.mod"
	"github.com/go-logr/logr v1.2.4"
	"github.com/go-ole/go-ole v1.2.6/go.mod"
	"github.com/go-ole/go-ole v1.3.0"
	"github.com/go-ole/go-ole v1.3.0/go.mod"
	"github.com/go-task/slim-sprig v0.0.0-20210107165309-348f09dbbbc0/go.mod"
	"github.com/go-task/slim-sprig v0.0.0-20230315185526-52ccab3ef572"
	"github.com/go-task/slim-sprig v0.0.0-20230315185526-52ccab3ef572/go.mod"
	"github.com/gogo/protobuf v1.3.2"
	"github.com/gogo/protobuf v1.3.2/go.mod"
	"github.com/golang/protobuf v1.2.0/go.mod"
	"github.com/golang/protobuf v1.4.0-rc.1/go.mod"
	"github.com/golang/protobuf v1.4.0-rc.1.0.20200221234624-67d41d38c208/go.mod"
	"github.com/golang/protobuf v1.4.0-rc.2/go.mod"
	"github.com/golang/protobuf v1.4.0-rc.4.0.20200313231945-b860323f09d0/go.mod"
	"github.com/golang/protobuf v1.4.0/go.mod"
	"github.com/golang/protobuf v1.4.2/go.mod"
	"github.com/golang/protobuf v1.5.0/go.mod"
	"github.com/golang/protobuf v1.5.2/go.mod"
	"github.com/golang/protobuf v1.5.3"
	"github.com/golang/protobuf v1.5.3/go.mod"
	"github.com/golang/snappy v0.0.4"
	"github.com/golang/snappy v0.0.4/go.mod"
	"github.com/google/go-cmp v0.3.0/go.mod"
	"github.com/google/go-cmp v0.3.1/go.mod"
	"github.com/google/go-cmp v0.4.0/go.mod"
	"github.com/google/go-cmp v0.5.5/go.mod"
	"github.com/google/go-cmp v0.5.6/go.mod"
	"github.com/google/go-cmp v0.5.7/go.mod"
	"github.com/google/go-cmp v0.5.9"
	"github.com/google/go-cmp v0.5.9/go.mod"
	"github.com/google/pprof v0.0.0-20210407192527-94a9f03dee38/go.mod"
	"github.com/google/pprof v0.0.0-20230912144702-c363fe2c2ed8"
	"github.com/google/pprof v0.0.0-20230912144702-c363fe2c2ed8/go.mod"
	"github.com/google/uuid v1.3.1"
	"github.com/google/uuid v1.3.1/go.mod"
	"github.com/greatroar/blobloom v0.7.2"
	"github.com/greatroar/blobloom v0.7.2/go.mod"
	"github.com/hashicorp/golang-lru/v2 v2.0.6"
	"github.com/hashicorp/golang-lru/v2 v2.0.6/go.mod"
	"github.com/hexops/gotextdiff v1.0.3"
	"github.com/hpcloud/tail v1.0.0/go.mod"
	"github.com/ianlancetaylor/demangle v0.0.0-20200824232613-28f6c0f3b639/go.mod"
	"github.com/jackpal/gateway v1.0.10"
	"github.com/jackpal/gateway v1.0.10/go.mod"
	"github.com/jackpal/go-nat-pmp v1.0.2"
	"github.com/jackpal/go-nat-pmp v1.0.2/go.mod"
	"github.com/julienschmidt/httprouter v1.3.0"
	"github.com/julienschmidt/httprouter v1.3.0/go.mod"
	"github.com/kballard/go-shellquote v0.0.0-20180428030007-95032a82bc51"
	"github.com/kballard/go-shellquote v0.0.0-20180428030007-95032a82bc51/go.mod"
	"github.com/kisielk/errcheck v1.5.0/go.mod"
	"github.com/kisielk/gotool v1.0.0/go.mod"
	"github.com/klauspost/cpuid/v2 v2.2.5"
	"github.com/klauspost/cpuid/v2 v2.2.5/go.mod"
	"github.com/lib/pq v1.10.9"
	"github.com/lib/pq v1.10.9/go.mod"
	"github.com/lufia/plan9stats v0.0.0-20211012122336-39d0f177ccd0/go.mod"
	"github.com/maruel/panicparse/v2 v2.3.1"
	"github.com/maruel/panicparse/v2 v2.3.1/go.mod"
	"github.com/mattn/go-colorable v0.1.12/go.mod"
	"github.com/mattn/go-isatty v0.0.14/go.mod"
	"github.com/matttproud/golang_protobuf_extensions v1.0.4"
	"github.com/matttproud/golang_protobuf_extensions v1.0.4/go.mod"
	"github.com/maxbrunsfeld/counterfeiter/v6 v6.5.0"
	"github.com/maxbrunsfeld/counterfeiter/v6 v6.5.0/go.mod"
	"github.com/mgutz/ansi v0.0.0-20200706080929-d51e80ef957d/go.mod"
	"github.com/minio/sha256-simd v1.0.1"
	"github.com/minio/sha256-simd v1.0.1/go.mod"
	"github.com/miscreant/miscreant.go v0.0.0-20200214223636-26d376326b75"
	"github.com/miscreant/miscreant.go v0.0.0-20200214223636-26d376326b75/go.mod"
	"github.com/nxadm/tail v1.4.4/go.mod"
	"github.com/nxadm/tail v1.4.8"
	"github.com/nxadm/tail v1.4.8/go.mod"
	"github.com/onsi/ginkgo v1.6.0/go.mod"
	"github.com/onsi/ginkgo v1.12.1/go.mod"
	"github.com/onsi/ginkgo v1.16.4/go.mod"
	"github.com/onsi/ginkgo v1.16.5"
	"github.com/onsi/ginkgo v1.16.5/go.mod"
	"github.com/onsi/ginkgo/v2 v2.1.3/go.mod"
	"github.com/onsi/ginkgo/v2 v2.12.1"
	"github.com/onsi/ginkgo/v2 v2.12.1/go.mod"
	"github.com/onsi/gomega v1.7.1/go.mod"
	"github.com/onsi/gomega v1.10.1/go.mod"
	"github.com/onsi/gomega v1.17.0/go.mod"
	"github.com/onsi/gomega v1.19.0/go.mod"
	"github.com/onsi/gomega v1.27.10"
	"github.com/oschwald/geoip2-golang v1.9.0"
	"github.com/oschwald/geoip2-golang v1.9.0/go.mod"
	"github.com/oschwald/maxminddb-golang v1.12.0"
	"github.com/oschwald/maxminddb-golang v1.12.0/go.mod"
	"github.com/petermattis/goid v0.0.0-20180202154549-b0b1615b78e5/go.mod"
	"github.com/petermattis/goid v0.0.0-20230904192822-1876fd5063bc"
	"github.com/petermattis/goid v0.0.0-20230904192822-1876fd5063bc/go.mod"
	"github.com/pierrec/lz4/v4 v4.1.18"
	"github.com/pierrec/lz4/v4 v4.1.18/go.mod"
	"github.com/pkg/errors v0.8.1/go.mod"
	"github.com/pkg/errors v0.9.1"
	"github.com/pkg/errors v0.9.1/go.mod"
	"github.com/pmezard/go-difflib v1.0.0"
	"github.com/pmezard/go-difflib v1.0.0/go.mod"
	"github.com/power-devops/perfstat v0.0.0-20210106213030-5aafc221ea8c/go.mod"
	"github.com/power-devops/perfstat v0.0.0-20221212215047-62379fc7944b"
	"github.com/power-devops/perfstat v0.0.0-20221212215047-62379fc7944b/go.mod"
	"github.com/prometheus/client_golang v1.16.0"
	"github.com/prometheus/client_golang v1.16.0/go.mod"
	"github.com/prometheus/client_model v0.4.0"
	"github.com/prometheus/client_model v0.4.0/go.mod"
	"github.com/prometheus/common v0.44.0"
	"github.com/prometheus/common v0.44.0/go.mod"
	"github.com/prometheus/procfs v0.12.0"
	"github.com/prometheus/procfs v0.12.0/go.mod"
	"github.com/quic-go/qtls-go1-20 v0.3.4"
	"github.com/quic-go/qtls-go1-20 v0.3.4/go.mod"
	"github.com/quic-go/quic-go v0.39.0"
	"github.com/quic-go/quic-go v0.39.0/go.mod"
	"github.com/rcrowley/go-metrics v0.0.0-20201227073835-cf1acfcdf475"
	"github.com/rcrowley/go-metrics v0.0.0-20201227073835-cf1acfcdf475/go.mod"
	"github.com/russross/blackfriday/v2 v2.1.0"
	"github.com/russross/blackfriday/v2 v2.1.0/go.mod"
	"github.com/sasha-s/go-deadlock v0.3.1"
	"github.com/sasha-s/go-deadlock v0.3.1/go.mod"
	"github.com/sclevine/spec v1.4.0"
	"github.com/shirou/gopsutil/v3 v3.23.8"
	"github.com/shirou/gopsutil/v3 v3.23.8/go.mod"
	"github.com/shoenig/go-m1cpu v0.1.6/go.mod"
	"github.com/shoenig/test v0.6.4/go.mod"
	"github.com/stretchr/objx v0.1.0/go.mod"
	"github.com/stretchr/objx v0.4.0/go.mod"
	"github.com/stretchr/objx v0.5.0/go.mod"
	"github.com/stretchr/testify v1.5.1/go.mod"
	"github.com/stretchr/testify v1.6.1/go.mod"
	"github.com/stretchr/testify v1.7.1/go.mod"
	"github.com/stretchr/testify v1.7.2/go.mod"
	"github.com/stretchr/testify v1.8.0/go.mod"
	"github.com/stretchr/testify v1.8.4"
	"github.com/stretchr/testify v1.8.4/go.mod"
	"github.com/syncthing/notify v0.0.0-20210616190510-c6b7342338d2"
	"github.com/syncthing/notify v0.0.0-20210616190510-c6b7342338d2/go.mod"
	"github.com/syndtr/goleveldb v1.0.1-0.20220721030215-126854af5e6d"
	"github.com/syndtr/goleveldb v1.0.1-0.20220721030215-126854af5e6d/go.mod"
	"github.com/thejerf/suture/v4 v4.0.2"
	"github.com/thejerf/suture/v4 v4.0.2/go.mod"
	"github.com/tklauser/go-sysconf v0.3.12/go.mod"
	"github.com/tklauser/numcpus v0.6.1/go.mod"
	"github.com/urfave/cli v1.20.0/go.mod"
	"github.com/urfave/cli v1.22.14"
	"github.com/urfave/cli v1.22.14/go.mod"
	"github.com/vitrun/qart v0.0.0-20160531060029-bf64b92db6b0"
	"github.com/vitrun/qart v0.0.0-20160531060029-bf64b92db6b0/go.mod"
	"github.com/yuin/goldmark v1.1.27/go.mod"
	"github.com/yuin/goldmark v1.2.1/go.mod"
	"github.com/yuin/goldmark v1.4.13/go.mod"
	"github.com/yusufpapurcu/wmi v1.2.3"
	"github.com/yusufpapurcu/wmi v1.2.3/go.mod"
	"go.uber.org/mock v0.3.0"
	"go.uber.org/mock v0.3.0/go.mod"
	"golang.org/x/crypto v0.0.0-20190308221718-c2843e01d9a2/go.mod"
	"golang.org/x/crypto v0.0.0-20191011191535-87dc89f01550/go.mod"
	"golang.org/x/crypto v0.0.0-20200622213623-75b288015ac9/go.mod"
	"golang.org/x/crypto v0.0.0-20210921155107-089bfa567519/go.mod"
	"golang.org/x/crypto v0.13.0"
	"golang.org/x/crypto v0.13.0/go.mod"
	"golang.org/x/exp v0.0.0-20230905200255-921286631fa9"
	"golang.org/x/exp v0.0.0-20230905200255-921286631fa9/go.mod"
	"golang.org/x/mod v0.2.0/go.mod"
	"golang.org/x/mod v0.3.0/go.mod"
	"golang.org/x/mod v0.6.0-dev.0.20220419223038-86c51ed26bb4/go.mod"
	"golang.org/x/mod v0.8.0/go.mod"
	"golang.org/x/mod v0.12.0"
	"golang.org/x/mod v0.12.0/go.mod"
	"golang.org/x/net v0.0.0-20180906233101-161cd47e91fd/go.mod"
	"golang.org/x/net v0.0.0-20190404232315-eb5bcb51f2a3/go.mod"
	"golang.org/x/net v0.0.0-20190620200207-3b0461eec859/go.mod"
	"golang.org/x/net v0.0.0-20200226121028-0de0cce0169b/go.mod"
	"golang.org/x/net v0.0.0-20200520004742-59133d7f0dd7/go.mod"
	"golang.org/x/net v0.0.0-20201021035429-f5854403a974/go.mod"
	"golang.org/x/net v0.0.0-20210226172049-e18ecbb05110/go.mod"
	"golang.org/x/net v0.0.0-20210428140749-89ef3d95e781/go.mod"
	"golang.org/x/net v0.0.0-20220225172249-27dd8689420f/go.mod"
	"golang.org/x/net v0.0.0-20220607020251-c690dde0001d/go.mod"
	"golang.org/x/net v0.0.0-20220722155237-a158d28d115b/go.mod"
	"golang.org/x/net v0.6.0/go.mod"
	"golang.org/x/net v0.10.0/go.mod"
	"golang.org/x/net v0.15.0"
	"golang.org/x/net v0.15.0/go.mod"
	"golang.org/x/sync v0.0.0-20180314180146-1d60e4601c6f/go.mod"
	"golang.org/x/sync v0.0.0-20181221193216-37e7f081c4d4/go.mod"
	"golang.org/x/sync v0.0.0-20190423024810-112230192c58/go.mod"
	"golang.org/x/sync v0.0.0-20190911185100-cd5d95a43a6e/go.mod"
	"golang.org/x/sync v0.0.0-20201020160332-67f06af15bc9/go.mod"
	"golang.org/x/sync v0.0.0-20220722155255-886fb9371eb4/go.mod"
	"golang.org/x/sync v0.1.0/go.mod"
	"golang.org/x/sync v0.3.0"
	"golang.org/x/sys v0.0.0-20180909124046-d0be0721c37e/go.mod"
	"golang.org/x/sys v0.0.0-20180926160741-c2ed4eda69e7/go.mod"
	"golang.org/x/sys v0.0.0-20190215142949-d0b11bdaac8a/go.mod"
	"golang.org/x/sys v0.0.0-20190412213103-97732733099d/go.mod"
	"golang.org/x/sys v0.0.0-20190904154756-749cb33beabd/go.mod"
	"golang.org/x/sys v0.0.0-20190916202348-b4ddaad3f8a3/go.mod"
	"golang.org/x/sys v0.0.0-20191005200804-aed5e4c7ecf9/go.mod"
	"golang.org/x/sys v0.0.0-20191120155948-bd437916bb0e/go.mod"
	"golang.org/x/sys v0.0.0-20191204072324-ce4227a45e2e/go.mod"
	"golang.org/x/sys v0.0.0-20200323222414-85ca7c5b95cd/go.mod"
	"golang.org/x/sys v0.0.0-20200930185726-fdedc70b468f/go.mod"
	"golang.org/x/sys v0.0.0-20201119102817-f84b799fce68/go.mod"
	"golang.org/x/sys v0.0.0-20201204225414-ed752295db88/go.mod"
	"golang.org/x/sys v0.0.0-20210112080510-489259a85091/go.mod"
	"golang.org/x/sys v0.0.0-20210423082822-04245dca01da/go.mod"
	"golang.org/x/sys v0.0.0-20210615035016-665e8c7367d1/go.mod"
	"golang.org/x/sys v0.0.0-20210630005230-0f9fa26af87c/go.mod"
	"golang.org/x/sys v0.0.0-20210927094055-39ccf1dd6fa6/go.mod"
	"golang.org/x/sys v0.0.0-20211216021012-1d35b9e2eb4e/go.mod"
	"golang.org/x/sys v0.0.0-20220408201424-a24fb2fb8a0f/go.mod"
	"golang.org/x/sys v0.0.0-20220412211240-33da011f77ad/go.mod"
	"golang.org/x/sys v0.0.0-20220520151302-bc2c85ada10a/go.mod"
	"golang.org/x/sys v0.0.0-20220722155257-8c9f86f7a55f/go.mod"
	"golang.org/x/sys v0.1.0/go.mod"
	"golang.org/x/sys v0.5.0/go.mod"
	"golang.org/x/sys v0.8.0/go.mod"
	"golang.org/x/sys v0.11.0/go.mod"
	"golang.org/x/sys v0.12.0"
	"golang.org/x/sys v0.12.0/go.mod"
	"golang.org/x/term v0.0.0-20201126162022-7de9c90e9dd1/go.mod"
	"golang.org/x/term v0.0.0-20210927222741-03fcf44c2211/go.mod"
	"golang.org/x/term v0.5.0/go.mod"
	"golang.org/x/term v0.8.0/go.mod"
	"golang.org/x/term v0.12.0/go.mod"
	"golang.org/x/text v0.3.0/go.mod"
	"golang.org/x/text v0.3.3/go.mod"
	"golang.org/x/text v0.3.6/go.mod"
	"golang.org/x/text v0.3.7/go.mod"
	"golang.org/x/text v0.7.0/go.mod"
	"golang.org/x/text v0.9.0/go.mod"
	"golang.org/x/text v0.13.0"
	"golang.org/x/text v0.13.0/go.mod"
	"golang.org/x/time v0.3.0"
	"golang.org/x/time v0.3.0/go.mod"
	"golang.org/x/tools v0.0.0-20180917221912-90fa682c2a6e/go.mod"
	"golang.org/x/tools v0.0.0-20191119224855-298f0cb1881e/go.mod"
	"golang.org/x/tools v0.0.0-20200619180055-7c47624df98f/go.mod"
	"golang.org/x/tools v0.0.0-20201224043029-2b0845dc783e/go.mod"
	"golang.org/x/tools v0.0.0-20210106214847-113979e3529a/go.mod"
	"golang.org/x/tools v0.1.12/go.mod"
	"golang.org/x/tools v0.6.0/go.mod"
	"golang.org/x/tools v0.13.0"
	"golang.org/x/tools v0.13.0/go.mod"
	"golang.org/x/xerrors v0.0.0-20190717185122-a985d3407aa7/go.mod"
	"golang.org/x/xerrors v0.0.0-20191011141410-1b5146add898/go.mod"
	"golang.org/x/xerrors v0.0.0-20191204190536-9bdfabe68543/go.mod"
	"golang.org/x/xerrors v0.0.0-20200804184101-5ec99f83aff1/go.mod"
	"golang.org/x/xerrors v0.0.0-20220517211312-f3a8303e98df/go.mod"
	"google.golang.org/protobuf v0.0.0-20200109180630-ec00e32a8dfd/go.mod"
	"google.golang.org/protobuf v0.0.0-20200221191635-4d8936d0db64/go.mod"
	"google.golang.org/protobuf v0.0.0-20200228230310-ab0ca4ff8a60/go.mod"
	"google.golang.org/protobuf v1.20.1-0.20200309200217-e05f789c0967/go.mod"
	"google.golang.org/protobuf v1.21.0/go.mod"
	"google.golang.org/protobuf v1.23.0/go.mod"
	"google.golang.org/protobuf v1.26.0-rc.1/go.mod"
	"google.golang.org/protobuf v1.26.0/go.mod"
	"google.golang.org/protobuf v1.31.0"
	"google.golang.org/protobuf v1.31.0/go.mod"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod"
	"gopkg.in/fsnotify.v1 v1.4.7/go.mod"
	"gopkg.in/tomb.v1 v1.0.0-20141024135613-dd632973f1e7"
	"gopkg.in/tomb.v1 v1.0.0-20141024135613-dd632973f1e7/go.mod"
	"gopkg.in/yaml.v2 v2.2.2/go.mod"
	"gopkg.in/yaml.v2 v2.2.4/go.mod"
	"gopkg.in/yaml.v2 v2.3.0/go.mod"
	"gopkg.in/yaml.v2 v2.4.0/go.mod"
	"gopkg.in/yaml.v3 v3.0.0-20200313102051-9f266ea9e77c/go.mod"
	"gopkg.in/yaml.v3 v3.0.1"
	"gopkg.in/yaml.v3 v3.0.1/go.mod"
)

go-module_set_globals

DESCRIPTION="Open Source Continuous File Synchronization"
HOMEPAGE="https://github.com/syncthing/syncthing"
SRC_URI="https://github.com/syncthing/syncthing/tarball/b89d9f88e7c37aa47eeccec98346b61174c9994a -> syncthing-1.25.0-b89d9f8.tar.gz
https://direct.funtoo.org/9c/ea/fd/9ceafd6e7e7fca848e2a818eb278cc21ede12c20e06431645c83235dfb74b0009b747e1a26597935c20c9fd88d88d1553a25bd7c828e3ae40d4e6472d76b05f5 -> syncthing-1.25.0-funtoo-go-bundle-4171a2baebc2f03efd10b21de4002752970607626b61cdcfa507fae198141bc6eaae7e0a348bad35fc3afdcd2c6c4bc6dab1f538c83d44c530445e023ca1fc4a.tar.gz"

LICENSE="Apache-2.0 BSD BSD-2 ISC MIT MPL-2.0 Unlicense"
SLOT="0"
KEYWORDS="*"
IUSE="tools"
S="${WORKDIR}/syncthing-syncthing-b89d9f8"

DEPEND=">=dev-lang/go-1.17"

DOCS=( README.md AUTHORS CONTRIBUTING.md )

pkg_setup() {
	enewgroup ${PN}
	enewuser ${PN} -1 -1 /var/lib/${PN} ${PN}

	if use tools ; then
		# separate user for the discovery server
		enewgroup stdiscosrv
		enewuser stdiscosrv -1 -1 /var/lib/stdiscosrv stdiscosrv
		keepdir /var/lib/stdiscosrv
		fowners stdiscosrv:stdiscosrv /var/lib/stdiscosrv

		# separate user for the relay server
		enewgroup strelaysrv
		enewuser strelaysrv -1 -1 /var/lib/strelaysrv strelaysrv
		# and his home folder
		keepdir /var/lib/strelaysrv
		fowners strelaysrv:strelaysrv /var/lib/strelaysrv
	fi
}

src_prepare() {
	# Bug #679280
	xdg_environment_reset

	default

	# We do not need this and it sometimes causes build failures
	rm -rf cmd/stupgrades
}

src_compile() {
	GOARCH= go run build.go -version "v${PV}" -no-upgrade -build-out=bin/ \
		${GOARCH:+-goarch="${GOARCH}"} \
		build $(usex tools "all" "") || die "build failed"
}

src_test() {
	go run build.go test || die "test failed"
}

src_install() {
	local icon_size

	doman man/*.[157]
	einstalldocs

	dobin bin/syncthing

	domenu etc/linux-desktop/*.desktop
	for icon_size in 32 64 128 256 512; do
		newicon -s ${icon_size} assets/logo-${icon_size}.png ${PN}.png
	done
	newicon -s scalable assets/logo-only.svg ${PN}.svg

	if use tools; then
		exeinto /usr/libexec/syncthing
		local exe
		for exe in bin/* ; do
			[[ "${exe}" == "bin/syncthing" ]] || doexe "${exe}"
		done
	fi

	# openrc service files
	newconfd "${FILESDIR}/${PN}.confd" ${PN}
	newinitd "${FILESDIR}/${PN}.initd" ${PN}

	keepdir /var/{lib,log}/${PN}
	fowners ${PN}:${PN} /var/{lib,log}/${PN}
	insinto /etc/logrotate.d
	newins "${FILESDIR}/${PN}.logrotate" ${PN}

	if use tools ; then
		# openrc service files

		newconfd "${FILESDIR}/stdiscosrv.confd" stdiscosrv
		newinitd "${FILESDIR}/stdiscosrv.initd" stdiscosrv

		newconfd "${FILESDIR}/strelaysrv.confd" strelaysrv
		newinitd "${FILESDIR}/strelaysrv.initd" strelaysrv

		insinto /etc/logrotate.d
		newins "${FILESDIR}/stdiscosrv.logrotate" strelaysrv
		newins "${FILESDIR}/strelaysrv.logrotate" strelaysrv
	fi
}

pkg_postinst() {
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
}