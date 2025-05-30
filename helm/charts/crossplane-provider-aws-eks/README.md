

# crossplane-provider-aws-eks

![Version: 0.0.12](https://img.shields.io/badge/Version-0.0.12-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.0.1](https://img.shields.io/badge/AppVersion-0.0.1-informational?style=flat-square)

A Helm Chart to template AWS EKS manifests for its crossplane provider.

**Homepage:** <https://github.com/openmcp-project/blueprints>

## Source Code

* <https://marketplace.upbound.io/providers/upbound/provider-aws-eks/>
* <https://docs.upbound.io/providers/>
* <https://docs.upbound.io/providers/provider-families/>
* <https://github.com/openmcp-project/blueprint-building-blocks>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| clusters[0].annotations | list | `[]` |  |
| clusters[0].labels | list | `[]` |  |
| clusters[0].name | string | `""` |  |
| clusters[0].ownerReferences | list | `[]` |  |
| clusters[0].spec.deletionPolicy | string | `""` |  |
| clusters[0].spec.forProvider | list | `[]` |  |
| clusters[0].spec.providerConfigRef | list | `[]` | ProviderConfigReference specifies how the provider that will be used to create, observe, update, and delete this managed resource should be configured. |
| clusters[0].spec.publishConnectionDetailsTo | list | `[]` | PublishConnectionDetailsTo specifies the connection secret config which contains a name, metadata and a reference to secret store config to which any connection details for this managed resource should be written. Connection details frequently include the endpoint, username, and password required to connect to the managed resource. |
| clusters[0].spec.writeConnectionSecretToRef | list | `[]` | *optional* - When a Crossplane Provider creates a managed resource it may generate resource-specific details, like usernames, passwords or connection details like an IP address.   Crossplane stores these details in a Kubernetes Secret object specified by the `writeConnectionSecretToRef` values. Learn more about Crossplane concept [Managed Resources Fields](https://docs.crossplane.io/latest/concepts/managed-resources/#writeconnectionsecrettoref)! |
| defaults.clusters.deletionPolicy | string | `""` |  |
| defaults.nodeGroups.deletionPolicy | string | `""` |  |
| nodeGroups | list | `[{"annotations":[],"labels":[],"name":"","ownerReferences":[],"spec":{"deletionPolicy":"","forProvider":[],"providerConfigRef":[],"publishConnectionDetailsTo":[],"writeConnectionSecretToRef":[]}}]` | https://marketplace.upbound.io/providers/upbound/provider-aws-eks/v1.11.0/resources/eks.aws.upbound.io/NodeGroup/v1beta1 |
| nodeGroups[0].spec | object | `{"deletionPolicy":"","forProvider":[],"providerConfigRef":[],"publishConnectionDetailsTo":[],"writeConnectionSecretToRef":[]}` | https://marketplace.upbound.io/providers/upbound/provider-aws-eks/v1.11.0/resources/eks.aws.upbound.io/Cluster/v1beta1 |
| nodeGroups[0].spec.providerConfigRef | list | `[]` | ProviderConfigReference specifies how the provider that will be used to create, observe, update, and delete this managed resource should be configured. |
| nodeGroups[0].spec.publishConnectionDetailsTo | list | `[]` | PublishConnectionDetailsTo specifies the connection secret config which contains a name, metadata and a reference to secret store config to which any connection details for this managed resource should be written. Connection details frequently include the endpoint, username, and password required to connect to the managed resource. |
| nodeGroups[0].spec.writeConnectionSecretToRef | list | `[]` | *optional* - When a Crossplane Provider creates a managed resource it may generate resource-specific details, like usernames, passwords or connection details like an IP address.   Crossplane stores these details in a Kubernetes Secret object specified by the `writeConnectionSecretToRef` values. Learn more about Crossplane concept [Managed Resources Fields](https://docs.crossplane.io/latest/concepts/managed-resources/#writeconnectionsecrettoref)! |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)