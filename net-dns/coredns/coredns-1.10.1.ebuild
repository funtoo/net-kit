# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

EGO_SUM=(
	"cloud.google.com/go v0.26.0/go.mod"
	"cloud.google.com/go v0.105.0"
	"cloud.google.com/go/compute v1.14.0"
	"cloud.google.com/go/compute v1.14.0/go.mod"
	"cloud.google.com/go/compute/metadata v0.2.3"
	"cloud.google.com/go/compute/metadata v0.2.3/go.mod"
	"cloud.google.com/go/longrunning v0.3.0"
	"github.com/!azure/azure-sdk-for-go v68.0.0+incompatible"
	"github.com/!azure/azure-sdk-for-go v68.0.0+incompatible/go.mod"
	"github.com/!azure/go-autorest v14.2.0+incompatible"
	"github.com/!azure/go-autorest v14.2.0+incompatible/go.mod"
	"github.com/!azure/go-autorest/autorest v0.11.24/go.mod"
	"github.com/!azure/go-autorest/autorest v0.11.28"
	"github.com/!azure/go-autorest/autorest v0.11.28/go.mod"
	"github.com/!azure/go-autorest/autorest/adal v0.9.18"
	"github.com/!azure/go-autorest/autorest/adal v0.9.18/go.mod"
	"github.com/!azure/go-autorest/autorest/azure/auth v0.5.12"
	"github.com/!azure/go-autorest/autorest/azure/auth v0.5.12/go.mod"
	"github.com/!azure/go-autorest/autorest/azure/cli v0.4.5"
	"github.com/!azure/go-autorest/autorest/azure/cli v0.4.5/go.mod"
	"github.com/!azure/go-autorest/autorest/date v0.3.0"
	"github.com/!azure/go-autorest/autorest/date v0.3.0/go.mod"
	"github.com/!azure/go-autorest/autorest/mocks v0.4.1/go.mod"
	"github.com/!azure/go-autorest/autorest/mocks v0.4.2"
	"github.com/!azure/go-autorest/autorest/mocks v0.4.2/go.mod"
	"github.com/!azure/go-autorest/autorest/to v0.2.0"
	"github.com/!azure/go-autorest/autorest/to v0.2.0/go.mod"
	"github.com/!azure/go-autorest/logger v0.2.1"
	"github.com/!azure/go-autorest/logger v0.2.1/go.mod"
	"github.com/!azure/go-autorest/tracing v0.6.0"
	"github.com/!azure/go-autorest/tracing v0.6.0/go.mod"
	"github.com/!burnt!sushi/toml v0.3.1/go.mod"
	"github.com/!data!dog/datadog-agent/pkg/obfuscate v0.0.0-20211129110424-6491aa3bf583"
	"github.com/!data!dog/datadog-agent/pkg/obfuscate v0.0.0-20211129110424-6491aa3bf583/go.mod"
	"github.com/!data!dog/datadog-agent/pkg/remoteconfig/state v0.42.0-rc.1"
	"github.com/!data!dog/datadog-agent/pkg/remoteconfig/state v0.42.0-rc.1/go.mod"
	"github.com/!data!dog/datadog-go v4.8.2+incompatible"
	"github.com/!data!dog/datadog-go v4.8.2+incompatible/go.mod"
	"github.com/!data!dog/datadog-go/v5 v5.0.2"
	"github.com/!data!dog/datadog-go/v5 v5.0.2/go.mod"
	"github.com/!data!dog/go-tuf v0.3.0--fix-localmeta-fork"
	"github.com/!data!dog/go-tuf v0.3.0--fix-localmeta-fork/go.mod"
	"github.com/!data!dog/sketches-go v1.2.1"
	"github.com/!data!dog/sketches-go v1.2.1/go.mod"
	"github.com/!microsoft/go-winio v0.5.0/go.mod"
	"github.com/!microsoft/go-winio v0.5.1"
	"github.com/!microsoft/go-winio v0.5.1/go.mod"
	"github.com/antonmedv/expr v1.12.0"
	"github.com/antonmedv/expr v1.12.0/go.mod"
	"github.com/apparentlymart/go-cidr v1.1.0"
	"github.com/apparentlymart/go-cidr v1.1.0/go.mod"
	"github.com/aws/aws-sdk-go v1.44.194"
	"github.com/aws/aws-sdk-go v1.44.194/go.mod"
	"github.com/beorn7/perks v1.0.1"
	"github.com/beorn7/perks v1.0.1/go.mod"
	"github.com/census-instrumentation/opencensus-proto v0.2.1/go.mod"
	"github.com/cespare/xxhash/v2 v2.1.1/go.mod"
	"github.com/cespare/xxhash/v2 v2.1.2"
	"github.com/cespare/xxhash/v2 v2.1.2/go.mod"
	"github.com/chzyer/logex v1.1.10/go.mod"
	"github.com/chzyer/readline v0.0.0-20180603132655-2972be24d48e/go.mod"
	"github.com/chzyer/test v0.0.0-20180213035817-a1ea475d72b1/go.mod"
	"github.com/client9/misspell v0.3.4/go.mod"
	"github.com/cncf/udpa/go v0.0.0-20191209042840-269d4d468f6f/go.mod"
	"github.com/codahale/rfc6979 v0.0.0-20141003034818-6a90f24967eb/go.mod"
	"github.com/coredns/caddy v1.1.1"
	"github.com/coredns/caddy v1.1.1/go.mod"
	"github.com/coreos/go-semver v0.3.0"
	"github.com/coreos/go-semver v0.3.0/go.mod"
	"github.com/coreos/go-systemd/v22 v22.3.2"
	"github.com/coreos/go-systemd/v22 v22.3.2/go.mod"
	"github.com/creack/pty v1.1.9/go.mod"
	"github.com/davecgh/go-spew v1.1.0/go.mod"
	"github.com/davecgh/go-spew v1.1.1"
	"github.com/davecgh/go-spew v1.1.1/go.mod"
	"github.com/dgraph-io/ristretto v0.1.0"
	"github.com/dgraph-io/ristretto v0.1.0/go.mod"
	"github.com/dgryski/go-farm v0.0.0-20190423205320-6a90982ecee2"
	"github.com/dgryski/go-farm v0.0.0-20190423205320-6a90982ecee2/go.mod"
	"github.com/dimchansky/utfbom v1.1.1"
	"github.com/dimchansky/utfbom v1.1.1/go.mod"
	"github.com/dnstap/golang-dnstap v0.4.0"
	"github.com/dnstap/golang-dnstap v0.4.0/go.mod"
	"github.com/docopt/docopt-go v0.0.0-20180111231733-ee0de3bc6815/go.mod"
	"github.com/dustin/go-humanize v1.0.0"
	"github.com/dustin/go-humanize v1.0.0/go.mod"
	"github.com/dvyukov/go-fuzz v0.0.0-20210103155950-6a8e9d1f2415/go.mod"
	"github.com/emicklei/go-restful/v3 v3.9.0"
	"github.com/emicklei/go-restful/v3 v3.9.0/go.mod"
	"github.com/envoyproxy/go-control-plane v0.9.0/go.mod"
	"github.com/envoyproxy/go-control-plane v0.9.1-0.20191026205805-5f8ba28d4473/go.mod"
	"github.com/envoyproxy/go-control-plane v0.9.4/go.mod"
	"github.com/envoyproxy/protoc-gen-validate v0.1.0/go.mod"
	"github.com/evanphx/json-patch v4.12.0+incompatible"
	"github.com/evanphx/json-patch v4.12.0+incompatible/go.mod"
	"github.com/farsightsec/golang-framestream v0.3.0"
	"github.com/farsightsec/golang-framestream v0.3.0/go.mod"
	"github.com/flynn/go-docopt v0.0.0-20140912013429-f6dd2ebbb31e/go.mod"
	"github.com/flynn/go-shlex v0.0.0-20150515145356-3f9db97f8568"
	"github.com/flynn/go-shlex v0.0.0-20150515145356-3f9db97f8568/go.mod"
	"github.com/fsnotify/fsnotify v1.4.7/go.mod"
	"github.com/fsnotify/fsnotify v1.4.9/go.mod"
	"github.com/go-logr/logr v1.2.0/go.mod"
	"github.com/go-logr/logr v1.2.3"
	"github.com/go-logr/logr v1.2.3/go.mod"
	"github.com/go-openapi/jsonpointer v0.19.3/go.mod"
	"github.com/go-openapi/jsonpointer v0.19.5"
	"github.com/go-openapi/jsonpointer v0.19.5/go.mod"
	"github.com/go-openapi/jsonreference v0.20.0"
	"github.com/go-openapi/jsonreference v0.20.0/go.mod"
	"github.com/go-openapi/swag v0.19.5/go.mod"
	"github.com/go-openapi/swag v0.19.14"
	"github.com/go-openapi/swag v0.19.14/go.mod"
	"github.com/go-task/slim-sprig v0.0.0-20210107165309-348f09dbbbc0/go.mod"
	"github.com/godbus/dbus/v5 v5.0.4/go.mod"
	"github.com/gogo/protobuf v1.3.2"
	"github.com/gogo/protobuf v1.3.2/go.mod"
	"github.com/golang-jwt/jwt/v4 v4.0.0/go.mod"
	"github.com/golang-jwt/jwt/v4 v4.2.0"
	"github.com/golang-jwt/jwt/v4 v4.2.0/go.mod"
	"github.com/golang/glog v0.0.0-20160126235308-23def4e6c14b"
	"github.com/golang/glog v0.0.0-20160126235308-23def4e6c14b/go.mod"
	"github.com/golang/groupcache v0.0.0-20200121045136-8c9f03a8e57e/go.mod"
	"github.com/golang/groupcache v0.0.0-20210331224755-41bb18bfe9da"
	"github.com/golang/groupcache v0.0.0-20210331224755-41bb18bfe9da/go.mod"
	"github.com/golang/mock v1.1.1/go.mod"
	"github.com/golang/protobuf v1.2.0/go.mod"
	"github.com/golang/protobuf v1.3.1/go.mod"
	"github.com/golang/protobuf v1.3.2/go.mod"
	"github.com/golang/protobuf v1.3.5/go.mod"
	"github.com/golang/protobuf v1.4.0-rc.1/go.mod"
	"github.com/golang/protobuf v1.4.0-rc.1.0.20200221234624-67d41d38c208/go.mod"
	"github.com/golang/protobuf v1.4.0-rc.2/go.mod"
	"github.com/golang/protobuf v1.4.0-rc.4.0.20200313231945-b860323f09d0/go.mod"
	"github.com/golang/protobuf v1.4.0/go.mod"
	"github.com/golang/protobuf v1.4.1/go.mod"
	"github.com/golang/protobuf v1.4.2/go.mod"
	"github.com/golang/protobuf v1.4.3/go.mod"
	"github.com/golang/protobuf v1.5.0/go.mod"
	"github.com/golang/protobuf v1.5.2"
	"github.com/golang/protobuf v1.5.2/go.mod"
	"github.com/golang/snappy v0.0.4/go.mod"
	"github.com/google/gnostic v0.5.7-v3refs"
	"github.com/google/gnostic v0.5.7-v3refs/go.mod"
	"github.com/google/go-cmp v0.2.0/go.mod"
	"github.com/google/go-cmp v0.3.0/go.mod"
	"github.com/google/go-cmp v0.3.1/go.mod"
	"github.com/google/go-cmp v0.4.0/go.mod"
	"github.com/google/go-cmp v0.5.0/go.mod"
	"github.com/google/go-cmp v0.5.3/go.mod"
	"github.com/google/go-cmp v0.5.5/go.mod"
	"github.com/google/go-cmp v0.5.9"
	"github.com/google/go-cmp v0.5.9/go.mod"
	"github.com/google/gofuzz v1.0.0/go.mod"
	"github.com/google/gofuzz v1.2.0"
	"github.com/google/gofuzz v1.2.0/go.mod"
	"github.com/google/pprof v0.0.0-20210407192527-94a9f03dee38/go.mod"
	"github.com/google/uuid v1.1.1/go.mod"
	"github.com/google/uuid v1.1.2/go.mod"
	"github.com/google/uuid v1.3.0"
	"github.com/google/uuid v1.3.0/go.mod"
	"github.com/googleapis/enterprise-certificate-proxy v0.2.1"
	"github.com/googleapis/enterprise-certificate-proxy v0.2.1/go.mod"
	"github.com/googleapis/gax-go/v2 v2.7.0"
	"github.com/googleapis/gax-go/v2 v2.7.0/go.mod"
	"github.com/grpc-ecosystem/grpc-opentracing v0.0.0-20180507213350-8e809c8a8645"
	"github.com/grpc-ecosystem/grpc-opentracing v0.0.0-20180507213350-8e809c8a8645/go.mod"
	"github.com/hpcloud/tail v1.0.0/go.mod"
	"github.com/ianlancetaylor/demangle v0.0.0-20200824232613-28f6c0f3b639/go.mod"
	"github.com/imdario/mergo v0.3.12"
	"github.com/imdario/mergo v0.3.12/go.mod"
	"github.com/infobloxopen/go-trees v0.0.0-20200715205103-96a057b8dfb9"
	"github.com/infobloxopen/go-trees v0.0.0-20200715205103-96a057b8dfb9/go.mod"
	"github.com/jmespath/go-jmespath v0.4.0"
	"github.com/jmespath/go-jmespath v0.4.0/go.mod"
	"github.com/jmespath/go-jmespath/internal/testify v1.5.1"
	"github.com/jmespath/go-jmespath/internal/testify v1.5.1/go.mod"
	"github.com/josharian/intern v1.0.0"
	"github.com/josharian/intern v1.0.0/go.mod"
	"github.com/json-iterator/go v1.1.12"
	"github.com/json-iterator/go v1.1.12/go.mod"
	"github.com/kisielk/errcheck v1.5.0/go.mod"
	"github.com/kisielk/gotool v1.0.0/go.mod"
	"github.com/kr/pretty v0.1.0/go.mod"
	"github.com/kr/pretty v0.2.0/go.mod"
	"github.com/kr/pretty v0.2.1"
	"github.com/kr/pretty v0.2.1/go.mod"
	"github.com/kr/pty v1.1.1/go.mod"
	"github.com/kr/text v0.1.0/go.mod"
	"github.com/kr/text v0.2.0"
	"github.com/kr/text v0.2.0/go.mod"
	"github.com/mailru/easyjson v0.0.0-20190614124828-94de47d64c63/go.mod"
	"github.com/mailru/easyjson v0.0.0-20190626092158-b2ccc519800e/go.mod"
	"github.com/mailru/easyjson v0.7.6/go.mod"
	"github.com/mailru/easyjson v0.7.7"
	"github.com/mailru/easyjson v0.7.7/go.mod"
	"github.com/matttproud/golang_protobuf_extensions v1.0.4"
	"github.com/matttproud/golang_protobuf_extensions v1.0.4/go.mod"
	"github.com/miekg/dns v1.1.31/go.mod"
	"github.com/miekg/dns v1.1.50"
	"github.com/miekg/dns v1.1.50/go.mod"
	"github.com/mitchellh/go-homedir v1.1.0"
	"github.com/mitchellh/go-homedir v1.1.0/go.mod"
	"github.com/modern-go/concurrent v0.0.0-20180228061459-e0a39a4cb421/go.mod"
	"github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd"
	"github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd/go.mod"
	"github.com/modern-go/reflect2 v1.0.2"
	"github.com/modern-go/reflect2 v1.0.2/go.mod"
	"github.com/munnerz/goautoneg v0.0.0-20191010083416-a7dc8b61c822"
	"github.com/munnerz/goautoneg v0.0.0-20191010083416-a7dc8b61c822/go.mod"
	"github.com/niemeyer/pretty v0.0.0-20200227124842-a10e7caefd8e/go.mod"
	"github.com/nxadm/tail v1.4.4/go.mod"
	"github.com/nxadm/tail v1.4.8/go.mod"
	"github.com/onsi/ginkgo v1.6.0/go.mod"
	"github.com/onsi/ginkgo v1.12.1/go.mod"
	"github.com/onsi/ginkgo v1.14.0/go.mod"
	"github.com/onsi/ginkgo v1.16.4/go.mod"
	"github.com/onsi/ginkgo v1.16.5"
	"github.com/onsi/ginkgo/v2 v2.0.0/go.mod"
	"github.com/onsi/ginkgo/v2 v2.4.0"
	"github.com/onsi/gomega v1.7.1/go.mod"
	"github.com/onsi/gomega v1.10.1/go.mod"
	"github.com/onsi/gomega v1.17.0/go.mod"
	"github.com/onsi/gomega v1.18.1/go.mod"
	"github.com/onsi/gomega v1.23.0"
	"github.com/opentracing-contrib/go-observer v0.0.0-20170622124052-a52f23424492"
	"github.com/opentracing-contrib/go-observer v0.0.0-20170622124052-a52f23424492/go.mod"
	"github.com/opentracing/opentracing-go v1.2.0"
	"github.com/opentracing/opentracing-go v1.2.0/go.mod"
	"github.com/openzipkin-contrib/zipkin-go-opentracing v0.5.0"
	"github.com/openzipkin-contrib/zipkin-go-opentracing v0.5.0/go.mod"
	"github.com/openzipkin/zipkin-go v0.4.1"
	"github.com/openzipkin/zipkin-go v0.4.1/go.mod"
	"github.com/oschwald/geoip2-golang v1.8.0"
	"github.com/oschwald/geoip2-golang v1.8.0/go.mod"
	"github.com/oschwald/maxminddb-golang v1.10.0"
	"github.com/oschwald/maxminddb-golang v1.10.0/go.mod"
	"github.com/philhofer/fwd v1.1.1"
	"github.com/philhofer/fwd v1.1.1/go.mod"
	"github.com/pkg/errors v0.8.1/go.mod"
	"github.com/pkg/errors v0.9.1"
	"github.com/pkg/errors v0.9.1/go.mod"
	"github.com/pmezard/go-difflib v1.0.0"
	"github.com/pmezard/go-difflib v1.0.0/go.mod"
	"github.com/prometheus/client_golang v1.14.0"
	"github.com/prometheus/client_golang v1.14.0/go.mod"
	"github.com/prometheus/client_model v0.0.0-20190812154241-14fe0d1b01d4/go.mod"
	"github.com/prometheus/client_model v0.3.0"
	"github.com/prometheus/client_model v0.3.0/go.mod"
	"github.com/prometheus/common v0.39.0"
	"github.com/prometheus/common v0.39.0/go.mod"
	"github.com/prometheus/procfs v0.8.0"
	"github.com/prometheus/procfs v0.8.0/go.mod"
	"github.com/secure-systems-lab/go-securesystemslib v0.3.1/go.mod"
	"github.com/secure-systems-lab/go-securesystemslib v0.4.0"
	"github.com/secure-systems-lab/go-securesystemslib v0.4.0/go.mod"
	"github.com/sirupsen/logrus v1.7.0/go.mod"
	"github.com/spf13/pflag v1.0.5"
	"github.com/spf13/pflag v1.0.5/go.mod"
	"github.com/stoewer/go-strcase v1.2.0/go.mod"
	"github.com/stretchr/objx v0.1.0/go.mod"
	"github.com/stretchr/objx v0.4.0/go.mod"
	"github.com/stretchr/objx v0.5.0"
	"github.com/stretchr/objx v0.5.0/go.mod"
	"github.com/stretchr/testify v1.2.2/go.mod"
	"github.com/stretchr/testify v1.3.0/go.mod"
	"github.com/stretchr/testify v1.4.0/go.mod"
	"github.com/stretchr/testify v1.5.1/go.mod"
	"github.com/stretchr/testify v1.6.1/go.mod"
	"github.com/stretchr/testify v1.7.0/go.mod"
	"github.com/stretchr/testify v1.7.1/go.mod"
	"github.com/stretchr/testify v1.8.0/go.mod"
	"github.com/stretchr/testify v1.8.1"
	"github.com/stretchr/testify v1.8.1/go.mod"
	"github.com/syndtr/goleveldb v1.0.1-0.20210819022825-2ae1ddf74ef7/go.mod"
	"github.com/tinylib/msgp v1.1.6"
	"github.com/tinylib/msgp v1.1.6/go.mod"
	"github.com/yuin/goldmark v1.1.27/go.mod"
	"github.com/yuin/goldmark v1.2.1/go.mod"
	"github.com/yuin/goldmark v1.3.5/go.mod"
	"github.com/yuin/goldmark v1.4.13/go.mod"
	"go.etcd.io/etcd/api/v3 v3.5.7"
	"go.etcd.io/etcd/api/v3 v3.5.7/go.mod"
	"go.etcd.io/etcd/client/pkg/v3 v3.5.7"
	"go.etcd.io/etcd/client/pkg/v3 v3.5.7/go.mod"
	"go.etcd.io/etcd/client/v3 v3.5.7"
	"go.etcd.io/etcd/client/v3 v3.5.7/go.mod"
	"go.opencensus.io v0.24.0"
	"go.opencensus.io v0.24.0/go.mod"
	"go.uber.org/atomic v1.7.0/go.mod"
	"go.uber.org/atomic v1.9.0"
	"go.uber.org/atomic v1.9.0/go.mod"
	"go.uber.org/multierr v1.6.0"
	"go.uber.org/multierr v1.6.0/go.mod"
	"go.uber.org/zap v1.17.0"
	"go.uber.org/zap v1.17.0/go.mod"
	"go4.org/intern v0.0.0-20211027215823-ae77deb06f29"
	"go4.org/intern v0.0.0-20211027215823-ae77deb06f29/go.mod"
	"go4.org/unsafe/assume-no-moving-gc v0.0.0-20211027215541-db492cf91b37/go.mod"
	"go4.org/unsafe/assume-no-moving-gc v0.0.0-20220617031537-928513b29760"
	"go4.org/unsafe/assume-no-moving-gc v0.0.0-20220617031537-928513b29760/go.mod"
	"golang.org/x/crypto v0.0.0-20190308221718-c2843e01d9a2/go.mod"
	"golang.org/x/crypto v0.0.0-20191011191535-87dc89f01550/go.mod"
	"golang.org/x/crypto v0.0.0-20200622213623-75b288015ac9/go.mod"
	"golang.org/x/crypto v0.0.0-20210921155107-089bfa567519/go.mod"
	"golang.org/x/crypto v0.0.0-20211117183948-ae814b36b871/go.mod"
	"golang.org/x/crypto v0.0.0-20211215153901-e495a2d5b3d3/go.mod"
	"golang.org/x/crypto v0.0.0-20220722155217-630584e8d5aa/go.mod"
	"golang.org/x/crypto v0.0.0-20221010152910-d6f0a8c073c2"
	"golang.org/x/crypto v0.0.0-20221010152910-d6f0a8c073c2/go.mod"
	"golang.org/x/exp v0.0.0-20190121172915-509febef88a4/go.mod"
	"golang.org/x/lint v0.0.0-20181026193005-c67002cb31c3/go.mod"
	"golang.org/x/lint v0.0.0-20190227174305-5b3e6a55c961/go.mod"
	"golang.org/x/lint v0.0.0-20190313153728-d0100b6bd8b3/go.mod"
	"golang.org/x/mod v0.1.1-0.20191105210325-c90efee705ee/go.mod"
	"golang.org/x/mod v0.2.0/go.mod"
	"golang.org/x/mod v0.3.0/go.mod"
	"golang.org/x/mod v0.4.2/go.mod"
	"golang.org/x/mod v0.6.0-dev.0.20220419223038-86c51ed26bb4/go.mod"
	"golang.org/x/mod v0.7.0"
	"golang.org/x/mod v0.7.0/go.mod"
	"golang.org/x/net v0.0.0-20180724234803-3673e40ba225/go.mod"
	"golang.org/x/net v0.0.0-20180826012351-8a410e7b638d/go.mod"
	"golang.org/x/net v0.0.0-20180906233101-161cd47e91fd/go.mod"
	"golang.org/x/net v0.0.0-20190213061140-3a22650c66bd/go.mod"
	"golang.org/x/net v0.0.0-20190311183353-d8887717615a/go.mod"
	"golang.org/x/net v0.0.0-20190404232315-eb5bcb51f2a3/go.mod"
	"golang.org/x/net v0.0.0-20190603091049-60506f45cf65/go.mod"
	"golang.org/x/net v0.0.0-20190620200207-3b0461eec859/go.mod"
	"golang.org/x/net v0.0.0-20190923162816-aa69164e4478/go.mod"
	"golang.org/x/net v0.0.0-20200226121028-0de0cce0169b/go.mod"
	"golang.org/x/net v0.0.0-20200520004742-59133d7f0dd7/go.mod"
	"golang.org/x/net v0.0.0-20200813134508-3edf25e44fcc/go.mod"
	"golang.org/x/net v0.0.0-20201021035429-f5854403a974/go.mod"
	"golang.org/x/net v0.0.0-20201110031124-69a78807bb2b/go.mod"
	"golang.org/x/net v0.0.0-20210226172049-e18ecbb05110/go.mod"
	"golang.org/x/net v0.0.0-20210405180319-a5a99cb37ef4/go.mod"
	"golang.org/x/net v0.0.0-20210428140749-89ef3d95e781/go.mod"
	"golang.org/x/net v0.0.0-20210726213435-c6fcb2dbf985/go.mod"
	"golang.org/x/net v0.0.0-20211112202133-69e39bad7dc2/go.mod"
	"golang.org/x/net v0.0.0-20220127200216-cd36cc0744dd/go.mod"
	"golang.org/x/net v0.0.0-20220722155237-a158d28d115b/go.mod"
	"golang.org/x/net v0.1.0/go.mod"
	"golang.org/x/net v0.4.0"
	"golang.org/x/net v0.4.0/go.mod"
	"golang.org/x/oauth2 v0.0.0-20180821212333-d2e6202438be/go.mod"
	"golang.org/x/oauth2 v0.3.0"
	"golang.org/x/oauth2 v0.3.0/go.mod"
	"golang.org/x/sync v0.0.0-20180314180146-1d60e4601c6f/go.mod"
	"golang.org/x/sync v0.0.0-20181108010431-42b317875d0f/go.mod"
	"golang.org/x/sync v0.0.0-20181221193216-37e7f081c4d4/go.mod"
	"golang.org/x/sync v0.0.0-20190423024810-112230192c58/go.mod"
	"golang.org/x/sync v0.0.0-20190911185100-cd5d95a43a6e/go.mod"
	"golang.org/x/sync v0.0.0-20201020160332-67f06af15bc9/go.mod"
	"golang.org/x/sync v0.0.0-20210220032951-036812b2e83c/go.mod"
	"golang.org/x/sync v0.0.0-20220722155255-886fb9371eb4/go.mod"
	"golang.org/x/sync v0.1.0"
	"golang.org/x/sys v0.0.0-20180830151530-49385e6e1522/go.mod"
	"golang.org/x/sys v0.0.0-20180909124046-d0be0721c37e/go.mod"
	"golang.org/x/sys v0.0.0-20190215142949-d0b11bdaac8a/go.mod"
	"golang.org/x/sys v0.0.0-20190412213103-97732733099d/go.mod"
	"golang.org/x/sys v0.0.0-20190904154756-749cb33beabd/go.mod"
	"golang.org/x/sys v0.0.0-20190924154521-2837fb4f24fe/go.mod"
	"golang.org/x/sys v0.0.0-20191005200804-aed5e4c7ecf9/go.mod"
	"golang.org/x/sys v0.0.0-20191026070338-33540a1f6037/go.mod"
	"golang.org/x/sys v0.0.0-20191120155948-bd437916bb0e/go.mod"
	"golang.org/x/sys v0.0.0-20191204072324-ce4227a45e2e/go.mod"
	"golang.org/x/sys v0.0.0-20200323222414-85ca7c5b95cd/go.mod"
	"golang.org/x/sys v0.0.0-20200519105757-fe76b779f299/go.mod"
	"golang.org/x/sys v0.0.0-20200814200057-3d37ad5750ed/go.mod"
	"golang.org/x/sys v0.0.0-20200930185726-fdedc70b468f/go.mod"
	"golang.org/x/sys v0.0.0-20201119102817-f84b799fce68/go.mod"
	"golang.org/x/sys v0.0.0-20210112080510-489259a85091/go.mod"
	"golang.org/x/sys v0.0.0-20210119212857-b64e53b001e4/go.mod"
	"golang.org/x/sys v0.0.0-20210124154548-22da62e12c0c/go.mod"
	"golang.org/x/sys v0.0.0-20210330210617-4fbd30eecc44/go.mod"
	"golang.org/x/sys v0.0.0-20210423082822-04245dca01da/go.mod"
	"golang.org/x/sys v0.0.0-20210510120138-977fb7262007/go.mod"
	"golang.org/x/sys v0.0.0-20210615035016-665e8c7367d1/go.mod"
	"golang.org/x/sys v0.0.0-20210630005230-0f9fa26af87c/go.mod"
	"golang.org/x/sys v0.0.0-20211216021012-1d35b9e2eb4e/go.mod"
	"golang.org/x/sys v0.0.0-20220520151302-bc2c85ada10a/go.mod"
	"golang.org/x/sys v0.0.0-20220722155257-8c9f86f7a55f/go.mod"
	"golang.org/x/sys v0.1.0/go.mod"
	"golang.org/x/sys v0.4.0"
	"golang.org/x/sys v0.4.0/go.mod"
	"golang.org/x/term v0.0.0-20201126162022-7de9c90e9dd1/go.mod"
	"golang.org/x/term v0.0.0-20210927222741-03fcf44c2211/go.mod"
	"golang.org/x/term v0.1.0/go.mod"
	"golang.org/x/term v0.3.0"
	"golang.org/x/term v0.3.0/go.mod"
	"golang.org/x/text v0.3.0/go.mod"
	"golang.org/x/text v0.3.2/go.mod"
	"golang.org/x/text v0.3.3/go.mod"
	"golang.org/x/text v0.3.6/go.mod"
	"golang.org/x/text v0.3.7/go.mod"
	"golang.org/x/text v0.4.0/go.mod"
	"golang.org/x/text v0.5.0"
	"golang.org/x/text v0.5.0/go.mod"
	"golang.org/x/time v0.0.0-20220210224613-90d013bbcef8"
	"golang.org/x/time v0.0.0-20220210224613-90d013bbcef8/go.mod"
	"golang.org/x/tools v0.0.0-20180917221912-90fa682c2a6e/go.mod"
	"golang.org/x/tools v0.0.0-20190114222345-bf090417da8b/go.mod"
	"golang.org/x/tools v0.0.0-20190226205152-f727befe758c/go.mod"
	"golang.org/x/tools v0.0.0-20190311212946-11955173bddd/go.mod"
	"golang.org/x/tools v0.0.0-20190524140312-2c0ae7006135/go.mod"
	"golang.org/x/tools v0.0.0-20191119224855-298f0cb1881e/go.mod"
	"golang.org/x/tools v0.0.0-20191216052735-49a3e744a425/go.mod"
	"golang.org/x/tools v0.0.0-20200619180055-7c47624df98f/go.mod"
	"golang.org/x/tools v0.0.0-20201022035929-9cf592e881e9/go.mod"
	"golang.org/x/tools v0.0.0-20201224043029-2b0845dc783e/go.mod"
	"golang.org/x/tools v0.0.0-20210106214847-113979e3529a/go.mod"
	"golang.org/x/tools v0.1.0/go.mod"
	"golang.org/x/tools v0.1.6-0.20210726203631-07bc1bf47fb2/go.mod"
	"golang.org/x/tools v0.1.12/go.mod"
	"golang.org/x/tools v0.4.0"
	"golang.org/x/tools v0.4.0/go.mod"
	"golang.org/x/xerrors v0.0.0-20190717185122-a985d3407aa7/go.mod"
	"golang.org/x/xerrors v0.0.0-20191011141410-1b5146add898/go.mod"
	"golang.org/x/xerrors v0.0.0-20191204190536-9bdfabe68543/go.mod"
	"golang.org/x/xerrors v0.0.0-20200804184101-5ec99f83aff1/go.mod"
	"golang.org/x/xerrors v0.0.0-20220907171357-04be3eba64a2"
	"golang.org/x/xerrors v0.0.0-20220907171357-04be3eba64a2/go.mod"
	"google.golang.org/api v0.109.0"
	"google.golang.org/api v0.109.0/go.mod"
	"google.golang.org/appengine v1.1.0/go.mod"
	"google.golang.org/appengine v1.4.0/go.mod"
	"google.golang.org/appengine v1.6.7"
	"google.golang.org/appengine v1.6.7/go.mod"
	"google.golang.org/genproto v0.0.0-20180817151627-c66870c02cf8/go.mod"
	"google.golang.org/genproto v0.0.0-20190819201941-24fa4b261c55/go.mod"
	"google.golang.org/genproto v0.0.0-20200526211855-cb27e3aa2013/go.mod"
	"google.golang.org/genproto v0.0.0-20201019141844-1ed22bb0c154/go.mod"
	"google.golang.org/genproto v0.0.0-20221227171554-f9683d7f8bef"
	"google.golang.org/genproto v0.0.0-20221227171554-f9683d7f8bef/go.mod"
	"google.golang.org/grpc v1.19.0/go.mod"
	"google.golang.org/grpc v1.23.0/go.mod"
	"google.golang.org/grpc v1.25.1/go.mod"
	"google.golang.org/grpc v1.27.0/go.mod"
	"google.golang.org/grpc v1.33.2/go.mod"
	"google.golang.org/grpc v1.52.3"
	"google.golang.org/grpc v1.52.3/go.mod"
	"google.golang.org/protobuf v0.0.0-20200109180630-ec00e32a8dfd/go.mod"
	"google.golang.org/protobuf v0.0.0-20200221191635-4d8936d0db64/go.mod"
	"google.golang.org/protobuf v0.0.0-20200228230310-ab0ca4ff8a60/go.mod"
	"google.golang.org/protobuf v1.20.1-0.20200309200217-e05f789c0967/go.mod"
	"google.golang.org/protobuf v1.21.0/go.mod"
	"google.golang.org/protobuf v1.22.0/go.mod"
	"google.golang.org/protobuf v1.23.0/go.mod"
	"google.golang.org/protobuf v1.23.1-0.20200526195155-81db48ad09cc/go.mod"
	"google.golang.org/protobuf v1.24.0/go.mod"
	"google.golang.org/protobuf v1.25.0/go.mod"
	"google.golang.org/protobuf v1.26.0-rc.1/go.mod"
	"google.golang.org/protobuf v1.26.0/go.mod"
	"google.golang.org/protobuf v1.27.1/go.mod"
	"google.golang.org/protobuf v1.28.1"
	"google.golang.org/protobuf v1.28.1/go.mod"
	"gopkg.in/!data!dog/dd-trace-go.v1 v1.47.0"
	"gopkg.in/!data!dog/dd-trace-go.v1 v1.47.0/go.mod"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod"
	"gopkg.in/check.v1 v1.0.0-20180628173108-788fd7840127/go.mod"
	"gopkg.in/check.v1 v1.0.0-20190902080502-41f04d3bba15/go.mod"
	"gopkg.in/check.v1 v1.0.0-20200227125254-8fa46927fb4f/go.mod"
	"gopkg.in/check.v1 v1.0.0-20201130134442-10cb98267c6c"
	"gopkg.in/check.v1 v1.0.0-20201130134442-10cb98267c6c/go.mod"
	"gopkg.in/fsnotify.v1 v1.4.7/go.mod"
	"gopkg.in/inf.v0 v0.9.1"
	"gopkg.in/inf.v0 v0.9.1/go.mod"
	"gopkg.in/tomb.v1 v1.0.0-20141024135613-dd632973f1e7/go.mod"
	"gopkg.in/yaml.v2 v2.2.2/go.mod"
	"gopkg.in/yaml.v2 v2.2.4/go.mod"
	"gopkg.in/yaml.v2 v2.2.8/go.mod"
	"gopkg.in/yaml.v2 v2.3.0/go.mod"
	"gopkg.in/yaml.v2 v2.4.0"
	"gopkg.in/yaml.v2 v2.4.0/go.mod"
	"gopkg.in/yaml.v3 v3.0.0-20200313102051-9f266ea9e77c/go.mod"
	"gopkg.in/yaml.v3 v3.0.0-20200615113413-eeeca48fe776/go.mod"
	"gopkg.in/yaml.v3 v3.0.0-20210107192922-496545a6307b/go.mod"
	"gopkg.in/yaml.v3 v3.0.1"
	"gopkg.in/yaml.v3 v3.0.1/go.mod"
	"honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod"
	"honnef.co/go/tools v0.0.0-20190523083050-ea95bdfd59fc/go.mod"
	"inet.af/netaddr v0.0.0-20220617031823-097006376321"
	"inet.af/netaddr v0.0.0-20220617031823-097006376321/go.mod"
	"k8s.io/api v0.26.1"
	"k8s.io/api v0.26.1/go.mod"
	"k8s.io/apimachinery v0.26.1"
	"k8s.io/apimachinery v0.26.1/go.mod"
	"k8s.io/client-go v0.26.1"
	"k8s.io/client-go v0.26.1/go.mod"
	"k8s.io/klog/v2 v2.90.0"
	"k8s.io/klog/v2 v2.90.0/go.mod"
	"k8s.io/kube-openapi v0.0.0-20221012153701-172d655c2280"
	"k8s.io/kube-openapi v0.0.0-20221012153701-172d655c2280/go.mod"
	"k8s.io/utils v0.0.0-20221107191617-1a15be271d1d"
	"k8s.io/utils v0.0.0-20221107191617-1a15be271d1d/go.mod"
	"sigs.k8s.io/json v0.0.0-20220713155537-f223a00ba0e2"
	"sigs.k8s.io/json v0.0.0-20220713155537-f223a00ba0e2/go.mod"
	"sigs.k8s.io/structured-merge-diff/v4 v4.2.3"
	"sigs.k8s.io/structured-merge-diff/v4 v4.2.3/go.mod"
	"sigs.k8s.io/yaml v1.3.0"
	"sigs.k8s.io/yaml v1.3.0/go.mod"

)

go-module_set_globals

DESCRIPTION="CoreDNS is a DNS server/forwarder, written in Go, that chains plugins"
HOMEPAGE="https://coredns.io/ https://github.com/coredns/coredns"
SRC_URI="https://github.com/coredns/coredns/tarball/055b2c31a9cf28321734e5f71613ea080d216cd3 -> coredns-1.10.1-055b2c3.tar.gz
https://direct.funtoo.org/63/40/f9/6340f91ef57dfd49d862581c879d9bad3b8b5af3da61a894bff0063c338d011c5767a2cb087f4edd8a2945890c552c8d91b990d69d8d580a3ee6cbf470b9531c -> coredns-1.10.1-funtoo-go-bundle-ca6f825cb0974696adb56dca9d166120706bcb5626a55535518eff7e33321659f4e8dc9a5a2abc6930e477584d57ade3ef6740631725cca784f57467a499f7cd.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="*"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=">=dev-lang/go-1.17"
S="${WORKDIR}/coredns-coredns-055b2c3"

src_install() {
	dobin ${PN}
	insinto /etc/"${PN}"
	doins "${FILESDIR}"/Corefile
	dodoc README.md
	doman man/*

	newinitd "${FILESDIR}"/"${PN}".initd ${PN}
	newconfd "${FILESDIR}"/"${PN}".confd ${PN}
	keepdir /var/log/"${PN}"
}