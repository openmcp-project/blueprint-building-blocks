

# crossplane-provider-aws-rds

![Version: 0.0.13](https://img.shields.io/badge/Version-0.0.13-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2.6.3](https://img.shields.io/badge/AppVersion-2.6.3-informational?style=flat-square)

A Helm Chart to template AWS RDS (Relational Database Service) manifests for its crossplane provider.

**Homepage:** <https://github.com/openmcp-project/blueprints>

## Source Code

* <https://github.com/upbound/provider-aws>
* <https://marketplace.upbound.io/providers/upbound/provider-aws-rds/>
* <https://marketplace.upbound.io/providers/upbound/provider-aws-rds/latest/resources/rds.aws.upbound.io/Instance/v1beta3>
* <https://marketplace.upbound.io/providers/upbound/provider-aws-rds/latest/resources/rds.aws.upbound.io/Cluster/v1beta2>
* <https://marketplace.upbound.io/providers/upbound/provider-aws-rds/latest/resources/rds.aws.upbound.io/ClusterInstance/v1beta1>
* <https://marketplace.upbound.io/providers/upbound/provider-aws-rds/latest/resources/rds.aws.upbound.io/SubnetGroup/v1beta1>
* <https://marketplace.upbound.io/providers/upbound/provider-aws-rds/latest/resources/rds.aws.upbound.io/ParameterGroup/v1beta1>
* <https://marketplace.upbound.io/providers/upbound/provider-aws-rds/latest/resources/rds.aws.upbound.io/GlobalCluster/v1beta1>
* <https://marketplace.upbound.io/providers/upbound/provider-aws-rds/latest/resources/rds.aws.upbound.io/Proxy/v1beta1>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| clusterInstances[0].annotations | list | `[]` |  |
| clusterInstances[0].labels | list | `[]` |  |
| clusterInstances[0].name | string | `""` |  |
| clusterInstances[0].ownerReferences | list | `[]` |  |
| clusterInstances[0].spec.deletionPolicy | string | `""` |  |
| clusterInstances[0].spec.forProvider | list | `[]` |  |
| clusterInstances[0].spec.providerConfigRef | list | `[]` | ProviderConfigReference specifies how the provider that will be used to create, observe, update, and delete this managed resource should be configured. |
| clusterInstances[0].spec.publishConnectionDetailsTo | list | `[]` | PublishConnectionDetailsTo specifies the connection secret config which contains a name, metadata and a reference to secret store config to which any connection details for this managed resource should be written. |
| clusterInstances[0].spec.writeConnectionSecretToRef | list | `[]` | *optional* - writeConnectionSecretToRef stores generated connection details in a Kubernetes Secret. |
| clusters[0].annotations | list | `[]` |  |
| clusters[0].labels | list | `[]` |  |
| clusters[0].name | string | `""` |  |
| clusters[0].ownerReferences | list | `[]` |  |
| clusters[0].spec.deletionPolicy | string | `""` |  |
| clusters[0].spec.forProvider | list | `[]` |  |
| clusters[0].spec.providerConfigRef | list | `[]` | ProviderConfigReference specifies how the provider that will be used to create, observe, update, and delete this managed resource should be configured. |
| clusters[0].spec.publishConnectionDetailsTo | list | `[]` | PublishConnectionDetailsTo specifies the connection secret config which contains a name, metadata and a reference to secret store config to which any connection details for this managed resource should be written. |
| clusters[0].spec.writeConnectionSecretToRef | list | `[]` | *optional* - writeConnectionSecretToRef stores generated connection details in a Kubernetes Secret. |
| defaults.clusterInstances.deletionPolicy | string | `""` |  |
| defaults.clusters.deletionPolicy | string | `""` |  |
| defaults.globalClusters.deletionPolicy | string | `""` |  |
| defaults.instances.deletionPolicy | string | `""` |  |
| defaults.parameterGroups.deletionPolicy | string | `""` |  |
| defaults.proxies.deletionPolicy | string | `""` |  |
| defaults.subnetGroups.deletionPolicy | string | `""` |  |
| globalClusters[0].annotations | list | `[]` |  |
| globalClusters[0].labels | list | `[]` |  |
| globalClusters[0].name | string | `""` |  |
| globalClusters[0].ownerReferences | list | `[]` |  |
| globalClusters[0].spec.deletionPolicy | string | `""` |  |
| globalClusters[0].spec.forProvider | list | `[]` |  |
| globalClusters[0].spec.providerConfigRef | list | `[]` | ProviderConfigReference specifies how the provider that will be used to create, observe, update, and delete this managed resource should be configured. |
| globalClusters[0].spec.publishConnectionDetailsTo | list | `[]` | PublishConnectionDetailsTo specifies the connection secret config which contains a name, metadata and a reference to secret store config to which any connection details for this managed resource should be written. |
| globalClusters[0].spec.writeConnectionSecretToRef | list | `[]` | *optional* - writeConnectionSecretToRef stores generated connection details in a Kubernetes Secret. |
| instances[0].annotations | list | `[]` |  |
| instances[0].labels | list | `[]` |  |
| instances[0].name | string | `""` |  |
| instances[0].ownerReferences | list | `[]` |  |
| instances[0].spec.deletionPolicy | string | `""` |  |
| instances[0].spec.forProvider | list | `[]` |  |
| instances[0].spec.providerConfigRef | list | `[]` | ProviderConfigReference specifies how the provider that will be used to create, observe, update, and delete this managed resource should be configured. |
| instances[0].spec.publishConnectionDetailsTo | list | `[]` | PublishConnectionDetailsTo specifies the connection secret config which contains a name, metadata and a reference to secret store config to which any connection details for this managed resource should be written. Connection details frequently include the endpoint, username, and password required to connect to the managed resource. |
| instances[0].spec.writeConnectionSecretToRef | list | `[]` | *optional* - When a Crossplane Provider creates a managed resource it may generate resource-specific details, like usernames, passwords or connection details like an IP address.   Crossplane stores these details in a Kubernetes Secret object specified by the `writeConnectionSecretToRef` values. Learn more about Crossplane concept [Managed Resources Fields](https://docs.crossplane.io/latest/concepts/managed-resources/#writeconnectionsecrettoref)! |
| parameterGroups[0].annotations | list | `[]` |  |
| parameterGroups[0].labels | list | `[]` |  |
| parameterGroups[0].name | string | `""` |  |
| parameterGroups[0].ownerReferences | list | `[]` |  |
| parameterGroups[0].spec.deletionPolicy | string | `""` |  |
| parameterGroups[0].spec.forProvider | list | `[]` |  |
| parameterGroups[0].spec.providerConfigRef | list | `[]` | ProviderConfigReference specifies how the provider that will be used to create, observe, update, and delete this managed resource should be configured. |
| parameterGroups[0].spec.publishConnectionDetailsTo | list | `[]` | PublishConnectionDetailsTo specifies the connection secret config which contains a name, metadata and a reference to secret store config to which any connection details for this managed resource should be written. |
| parameterGroups[0].spec.writeConnectionSecretToRef | list | `[]` | *optional* - writeConnectionSecretToRef stores generated connection details in a Kubernetes Secret. |
| proxies[0].annotations | list | `[]` |  |
| proxies[0].labels | list | `[]` |  |
| proxies[0].name | string | `""` |  |
| proxies[0].ownerReferences | list | `[]` |  |
| proxies[0].spec.deletionPolicy | string | `""` |  |
| proxies[0].spec.forProvider | list | `[]` |  |
| proxies[0].spec.providerConfigRef | list | `[]` | ProviderConfigReference specifies how the provider that will be used to create, observe, update, and delete this managed resource should be configured. |
| proxies[0].spec.publishConnectionDetailsTo | list | `[]` | PublishConnectionDetailsTo specifies the connection secret config which contains a name, metadata and a reference to secret store config to which any connection details for this managed resource should be written. |
| proxies[0].spec.writeConnectionSecretToRef | list | `[]` | *optional* - writeConnectionSecretToRef stores generated connection details in a Kubernetes Secret. |
| subnetGroups[0].annotations | list | `[]` |  |
| subnetGroups[0].labels | list | `[]` |  |
| subnetGroups[0].name | string | `""` |  |
| subnetGroups[0].ownerReferences | list | `[]` |  |
| subnetGroups[0].spec.deletionPolicy | string | `""` |  |
| subnetGroups[0].spec.forProvider | list | `[]` |  |
| subnetGroups[0].spec.providerConfigRef | list | `[]` | ProviderConfigReference specifies how the provider that will be used to create, observe, update, and delete this managed resource should be configured. |
| subnetGroups[0].spec.publishConnectionDetailsTo | list | `[]` | PublishConnectionDetailsTo specifies the connection secret config which contains a name, metadata and a reference to secret store config to which any connection details for this managed resource should be written. |
| subnetGroups[0].spec.writeConnectionSecretToRef | list | `[]` | *optional* - writeConnectionSecretToRef stores generated connection details in a Kubernetes Secret. |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)