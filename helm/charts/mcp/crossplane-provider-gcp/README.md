

# crossplane-provider-gcp

![Version: 0.0.10](https://img.shields.io/badge/Version-0.0.10-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.0.1](https://img.shields.io/badge/AppVersion-0.0.1-informational?style=flat-square)

A Helm Chart to template GCP manifests for its crossplane provider.

**Homepage:** <https://github.com/openmcp-project/blueprints>

## Source Code

* <https://github.com/openmcp-project/blueprint-building-blocks>
* <https://marketplace.upbound.io/providers/crossplane-contrib/provider-gcp>
* <https://docs.upbound.io/providers/>
* <https://docs.upbound.io/providers/provider-families/>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| defaults.serviceAccountKeys.deletionPolicy | string | `""` |  |
| defaults.serviceAccountPolicys.deletionPolicy | string | `""` |  |
| defaults.serviceAccounts.deletionPolicy | string | `""` |  |
| serviceAccountKeys[0].annotations | list | `[]` |  |
| serviceAccountKeys[0].labels | list | `[]` |  |
| serviceAccountKeys[0].name | string | `""` |  |
| serviceAccountKeys[0].ownerReferences | list | `[]` |  |
| serviceAccountKeys[0].spec.deletionPolicy | string | `""` |  |
| serviceAccountKeys[0].spec.forProvider | list | `[]` |  |
| serviceAccountKeys[0].spec.providerConfigRef | list | `[]` | ProviderConfigReference specifies how the provider that will be used to create, observe, update, and delete this managed resource should be configured. |
| serviceAccountKeys[0].spec.publishConnectionDetailsTo | list | `[]` | PublishConnectionDetailsTo specifies the connection secret config which contains a name, metadata and a reference to secret store config to which any connection details for this managed resource should be written. Connection details frequently include the endpoint, username, and password required to connect to the managed resource. |
| serviceAccountKeys[0].spec.writeConnectionSecretToRef | list | `[]` | *optional* - When a Crossplane Provider creates a managed resource it may generate resource-specific details, like usernames, passwords or connection details like an IP address.   Crossplane stores these details in a Kubernetes Secret object specified by the `writeConnectionSecretToRef` values. Learn more about Crossplane concept [Managed Resources Fields](https://docs.crossplane.io/latest/concepts/managed-resources/#writeconnectionsecrettoref)! |
| serviceAccountPolicys[0].annotations | list | `[]` |  |
| serviceAccountPolicys[0].labels | list | `[]` |  |
| serviceAccountPolicys[0].name | string | `""` |  |
| serviceAccountPolicys[0].ownerReferences | list | `[]` |  |
| serviceAccountPolicys[0].spec.deletionPolicy | string | `""` |  |
| serviceAccountPolicys[0].spec.forProvider | list | `[]` |  |
| serviceAccountPolicys[0].spec.providerConfigRef | list | `[]` | ProviderConfigReference specifies how the provider that will be used to create, observe, update, and delete this managed resource should be configured. |
| serviceAccountPolicys[0].spec.publishConnectionDetailsTo | list | `[]` | PublishConnectionDetailsTo specifies the connection secret config which contains a name, metadata and a reference to secret store config to which any connection details for this managed resource should be written. Connection details frequently include the endpoint, username, and password required to connect to the managed resource. |
| serviceAccountPolicys[0].spec.writeConnectionSecretToRef | list | `[]` | *optional* - When a Crossplane Provider creates a managed resource it may generate resource-specific details, like usernames, passwords or connection details like an IP address.   Crossplane stores these details in a Kubernetes Secret object specified by the `writeConnectionSecretToRef` values. Learn more about Crossplane concept [Managed Resources Fields](https://docs.crossplane.io/latest/concepts/managed-resources/#writeconnectionsecrettoref)! |
| serviceAccounts[0].annotations | list | `[]` |  |
| serviceAccounts[0].labels | list | `[]` |  |
| serviceAccounts[0].name | string | `""` |  |
| serviceAccounts[0].ownerReferences | list | `[]` |  |
| serviceAccounts[0].spec.deletionPolicy | string | `""` |  |
| serviceAccounts[0].spec.forProvider | list | `[]` |  |
| serviceAccounts[0].spec.providerConfigRef | list | `[]` | ProviderConfigReference specifies how the provider that will be used to create, observe, update, and delete this managed resource should be configured. |
| serviceAccounts[0].spec.publishConnectionDetailsTo | list | `[]` | PublishConnectionDetailsTo specifies the connection secret config which contains a name, metadata and a reference to secret store config to which any connection details for this managed resource should be written. Connection details frequently include the endpoint, username, and password required to connect to the managed resource. |
| serviceAccounts[0].spec.writeConnectionSecretToRef | list | `[]` | *optional* - When a Crossplane Provider creates a managed resource it may generate resource-specific details, like usernames, passwords or connection details like an IP address.   Crossplane stores these details in a Kubernetes Secret object specified by the `writeConnectionSecretToRef` values. Learn more about Crossplane concept [Managed Resources Fields](https://docs.crossplane.io/latest/concepts/managed-resources/#writeconnectionsecrettoref)! |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)