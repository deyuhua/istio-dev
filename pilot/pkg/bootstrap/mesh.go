// Copyright 2019 Istio Authors
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package bootstrap

import (
	"encoding/json"

	"istio.io/istio/pkg/util/gogoprotomarshal"

	"istio.io/pkg/filewatcher"
	"istio.io/pkg/log"
	"istio.io/pkg/version"

	"istio.io/istio/pkg/config/mesh"
)

// initMeshConfiguration creates the mesh in the pilotConfig from the input arguments.
func (s *Server) initMeshConfiguration(args *PilotArgs, fileWatcher filewatcher.FileWatcher) {
	defer func() {
		if s.environment.Watcher != nil {
			meshdump, _ := gogoprotomarshal.ToJSONWithIndent(s.environment.Mesh(), "    ")
			log.Infof("mesh configuration: %s", meshdump)
			log.Infof("version: %s", version.Info.String())
			argsdump, _ := json.MarshalIndent(args, "", "   ")
			log.Infof("flags: %s", argsdump)
		}
	}()

	// If a config file was specified, use it.
	// MeshConfig is nil
	if args.MeshConfig != nil {
		s.environment.Watcher = mesh.NewFixedWatcher(args.MeshConfig)
		return
	}

	var err error
	// args.Mesh.ConfigFile: /etc/istio/config/mesh
	// accessLogEncoding: TEXT
	// accessLogFile: ""
	// accessLogFormat: ""
	// defaultConfig:
	//   concurrency: 2
	//   configPath: ./etc/istio/proxy
	//   connectTimeout: 10s
	//   controlPlaneAuthPolicy: NONE
	//   discoveryAddress: istiod.istio-system.svc:15012
	//   drainDuration: 45s
	//   parentShutdownDuration: 1m0s
	//   proxyAdminPort: 15000
	//   proxyMetadata:
	//     DNS_AGENT: ""
	//   serviceCluster: istio-proxy
	//   tracing:
	//     zipkin:
	//       address: zipkin.istio-system:9411
	// disableMixerHttpReports: true
	// disablePolicyChecks: true
	// enablePrometheusMerge: false
	// ingressClass: istio
	// ingressControllerMode: STRICT
	// ingressService: istio-ingressgateway
	// protocolDetectionTimeout: 100ms
	// reportBatchMaxEntries: 100
	// reportBatchMaxTime: 1s
	// sdsUdsPath: unix:/etc/istio/proxy/SDS
	// trustDomain: cluster.local

	// 监控mesh文件的变化，监听前先获取默认配置参数，并且校验是否合法
	s.environment.Watcher, err = mesh.NewWatcher(fileWatcher, args.Mesh.ConfigFile)
	// 上述步骤无错误，立即返回
	if err == nil {
		return
	}

	// Config file either wasn't specified or failed to load - use a default mesh.
	// 否则使用系统默认的mesh的配置参数
	mc := mesh.DefaultMeshConfig()
	meshConfig := &mc

	// Allow some overrides for testing purposes.
	if args.Mesh.MixerAddress != "" {
		meshConfig.MixerCheckServer = args.Mesh.MixerAddress
		meshConfig.MixerReportServer = args.Mesh.MixerAddress
	}
	s.environment.Watcher = mesh.NewFixedWatcher(meshConfig)
}

// initMeshNetworks loads the mesh networks configuration from the file provided
// in the args and add a watcher for changes in this file.
func (s *Server) initMeshNetworks(args *PilotArgs, fileWatcher filewatcher.FileWatcher) {
	if args.NetworksConfigFile != "" {
		var err error
		s.environment.NetworksWatcher, err = mesh.NewNetworksWatcher(fileWatcher, args.NetworksConfigFile)
		if err != nil {
			log.Infoa(err)
		}
	}

	if s.environment.NetworksWatcher == nil {
		log.Info("mesh networks configuration not provided")
		s.environment.NetworksWatcher = mesh.NewFixedNetworksWatcher(nil)
	}
}
