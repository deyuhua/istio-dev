module istio.io/istio

go 1.13

replace github.com/golang/glog => github.com/istio/glog v0.0.0-20190424172949-d7cfb6fa2ccd

replace k8s.io/klog => github.com/istio/klog v0.0.0-20190424230111-fb7481ea8bcf

replace github.com/spf13/viper => github.com/istio/viper v1.3.3-0.20190515210538-2789fed3109c

// For license
replace github.com/docker/docker => github.com/docker/engine v1.4.2-0.20191011211953-adfac697dc5b

// Old version had no license
replace github.com/chzyer/logex => github.com/chzyer/logex v1.1.11-0.20170329064859-445be9e134b2

// Avoid pulling in incompatible libraries
replace github.com/docker/distribution => github.com/docker/distribution v2.7.1+incompatible

// Avoid pulling in kubernetes/kubernetes
replace github.com/Microsoft/hcsshim => github.com/Microsoft/hcsshim v0.8.8-0.20200421182805-c3e488f0d815

// Client-go does not handle different versions of mergo due to some breaking changes - use the matching version
replace github.com/imdario/mergo => github.com/imdario/mergo v0.3.5

require (
	cloud.google.com/go/compute/metadata v0.2.1
	cloud.google.com/go/container v1.9.0 // indirect
	cloud.google.com/go/logging v1.0.0
	cloud.google.com/go/monitoring v1.9.0
	contrib.go.opencensus.io/exporter/prometheus v0.1.0
	contrib.go.opencensus.io/exporter/stackdriver v0.12.9
	contrib.go.opencensus.io/exporter/zipkin v0.1.1
	fortio.org/fortio v1.3.1
	github.com/DataDog/datadog-go v2.2.0+incompatible
	github.com/Masterminds/semver v1.5.0
	github.com/Masterminds/sprig v2.22.0+incompatible
	github.com/alicebob/gopher-json v0.0.0-20180125190556-5a6b3ba71ee6 // indirect
	github.com/alicebob/miniredis v2.5.0+incompatible
	github.com/aws/aws-sdk-go v1.43.16
	github.com/bmizerany/assert v0.0.0-20160611221934-b7ed37b82869 // indirect
	github.com/cactus/go-statsd-client v3.1.1+incompatible
	github.com/cenkalti/backoff v2.0.0+incompatible
	github.com/census-instrumentation/opencensus-proto v0.2.1
	github.com/cheggaaa/pb/v3 v3.0.4
	github.com/circonus-labs/circonus-gometrics v2.3.1+incompatible
	github.com/circonus-labs/circonusllhist v0.1.4 // indirect
	github.com/cncf/udpa/go v0.0.0-20210930031921-04548b0d99d4
	github.com/codahale/hdrhistogram v0.0.0-20161010025455-3a0bb77429bd // indirect
	github.com/coreos/etcd v3.3.15+incompatible
	github.com/coreos/go-oidc v2.1.0+incompatible
	github.com/d4l3k/messagediff v1.2.1
	github.com/davecgh/go-spew v1.1.1
	github.com/dchest/siphash v1.1.0 // indirect
	github.com/docker/distribution v2.8.1+incompatible
	github.com/docker/docker v20.10.17+incompatible
	github.com/docker/go-connections v0.4.0
	github.com/dsnet/compress v0.0.1 // indirect
	github.com/elazarl/goproxy v0.0.0-20190630181448-f1e96bc0f4c5 // indirect
	github.com/elazarl/goproxy/ext v0.0.0-20190630181448-f1e96bc0f4c5 // indirect
	github.com/emicklei/go-restful v2.9.6+incompatible // indirect
	github.com/envoyproxy/go-control-plane v0.10.2-0.20220325020618-49ff273808a1
	github.com/evanphx/json-patch v5.6.0+incompatible
	github.com/fatih/color v1.13.0
	github.com/fluent/fluent-logger-golang v1.3.0
	github.com/fsnotify/fsnotify v1.4.9
	github.com/ghodss/yaml v1.0.0
	github.com/go-redis/redis v6.10.2+incompatible
	github.com/gogo/protobuf v1.3.2
	github.com/golang/glog v0.0.0-20160126235308-23def4e6c14b
	github.com/golang/protobuf v1.5.2
	github.com/golang/sync v0.0.0-20180314180146-1d60e4601c6f
	github.com/google/cel-go v0.12.5
	github.com/google/go-cmp v0.5.9
	github.com/google/gofuzz v1.2.0
	github.com/google/uuid v1.3.0
	github.com/googleapis/gax-go v2.0.2+incompatible
	github.com/googleapis/gax-go/v2 v2.7.0
	github.com/gorilla/mux v1.8.0
	github.com/gorilla/websocket v1.4.2
	github.com/gregjones/httpcache v0.0.0-20190611155906-901d90724c79 // indirect
	github.com/grpc-ecosystem/go-grpc-middleware v1.3.0
	github.com/grpc-ecosystem/go-grpc-prometheus v1.2.0
	github.com/grpc-ecosystem/grpc-opentracing v0.0.0-20171214222146-0e7658f8ee99
	github.com/hashicorp/consul v1.3.1
	github.com/hashicorp/go-msgpack v0.5.5 // indirect
	github.com/hashicorp/go-multierror v1.1.1
	github.com/hashicorp/go-version v1.2.0
	github.com/hashicorp/golang-lru v0.5.4 // indirect
	github.com/hashicorp/serf v0.8.5 // indirect
	github.com/hashicorp/vault/api v1.0.3
	github.com/howeyc/fsnotify v0.9.0
	github.com/kr/pretty v0.2.1
	github.com/kylelemons/godebug v1.1.0
	github.com/lestrrat-go/jwx v0.9.0
	github.com/mattn/go-isatty v0.0.14
	github.com/mholt/archiver v3.1.1+incompatible
	github.com/miekg/dns v1.0.14
	github.com/mitchellh/copystructure v1.2.0
	github.com/mitchellh/go-homedir v1.1.0
	github.com/natefinch/lumberjack v2.0.0+incompatible
	github.com/nwaples/rardecode v1.0.0 // indirect
	github.com/onsi/gomega v1.20.1
	github.com/open-policy-agent/opa v0.8.2
	github.com/openshift/api v3.9.1-0.20191008181517-e4fd21196097+incompatible
	github.com/opentracing/opentracing-go v1.1.0
	github.com/openzipkin/zipkin-go v0.1.7
	github.com/philhofer/fwd v1.0.0 // indirect
	github.com/pierrec/lz4 v2.2.7+incompatible // indirect
	github.com/pkg/errors v0.9.1
	github.com/pmezard/go-difflib v1.0.0
	github.com/prometheus/client_golang v1.12.1
	github.com/prometheus/client_model v0.2.0
	github.com/prometheus/common v0.32.1
	github.com/prometheus/prom2json v1.2.2
	github.com/ryanuber/go-glob v1.0.0
	github.com/satori/go.uuid v1.2.0
	github.com/spf13/cobra v1.5.0
	github.com/spf13/jwalterweatherman v1.1.0 // indirect
	github.com/spf13/pflag v1.0.5
	github.com/spf13/viper v1.8.1
	github.com/stretchr/testify v1.8.1
	github.com/tinylib/msgp v1.0.2 // indirect
	github.com/uber/jaeger-client-go v0.0.0-20190228190846-ecf2d03a9e80
	github.com/uber/jaeger-lib v2.0.0+incompatible // indirect
	github.com/xeipuuv/gojsonpointer v0.0.0-20190905194746-02993c407bfb // indirect
	github.com/xi2/xz v0.0.0-20171230120015-48954b6210f8 // indirect
	github.com/yashtewari/glob-intersection v0.0.0-20180206001645-7af743e8ec84 // indirect
	github.com/yl2chen/cidranger v0.0.0-20180214081945-928b519e5268
	github.com/yuin/gopher-lua v0.0.0-20191220021717-ab39c6098bdb // indirect
	go.opencensus.io v0.24.0
	go.uber.org/atomic v1.7.0
	go.uber.org/zap v1.19.0
	golang.org/x/crypto v0.0.0-20220525230936-793ad666bf5e
	golang.org/x/net v0.0.0-20221014081412-f15817d10f9b
	golang.org/x/oauth2 v0.0.0-20221014153046-6fdb5e3db783
	golang.org/x/sync v0.1.0
	golang.org/x/time v0.0.0-20220210224613-90d013bbcef8
	golang.org/x/tools v0.1.12
	google.golang.org/api v0.103.0
	google.golang.org/genproto v0.0.0-20221201164419-0e50fba7f41c
	google.golang.org/grpc v1.50.1
	gopkg.in/d4l3k/messagediff.v1 v1.2.1
	gopkg.in/square/go-jose.v2 v2.5.1
	gopkg.in/yaml.v2 v2.4.0
	helm.sh/helm/v3 v3.10.3
	istio.io/api v0.0.0-20200521171657-32375f234cc1
	istio.io/gogo-genproto v0.0.0-20200422223746-8166b73efbae
	istio.io/pkg v0.0.0-20200504224939-261164cc57da
	k8s.io/api v0.25.2
	k8s.io/apiextensions-apiserver v0.25.2
	k8s.io/apimachinery v0.25.2
	k8s.io/cli-runtime v0.25.2
	k8s.io/client-go v0.25.2
	k8s.io/kubectl v0.25.2
	k8s.io/utils v0.0.0-20220728103510-ee6ede2d64ed
	sigs.k8s.io/controller-runtime v0.5.1-0.20200327213554-2d4c4877f906
	sigs.k8s.io/service-apis v0.0.0-20200227172328-b9010cfacdbe
	sigs.k8s.io/yaml v1.3.0
)
