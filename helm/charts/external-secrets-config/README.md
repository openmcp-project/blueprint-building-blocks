

# external-secrets-config

![Version: 0.1.10](https://img.shields.io/badge/Version-0.1.10-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.10.0](https://img.shields.io/badge/AppVersion-0.10.0-informational?style=flat-square)

A Helm Chart to template external-secrets.io manifests to sync credentials from remote vault (e.g. SAP HashiCorp Vault).

**Homepage:** <https://github.com/openmcp-project/blueprints>

## Source Code

* <https://github.com/openmcp-project/blueprint-building-blocks>
* <https://external-secrets.io>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| clusterExternalSecret | list | {} | [ClusterExternalSecret](https://external-secrets.io/latest/api/spec/#external-secrets.io/v1beta1.ClusterExternalSecretSpec) is the Schema for the external-secrets API. |
| clusterExternalSecret[0].externalSecretName | string | `""` | *(optional)* The name of the external secrets to be created defaults to the name of the ClusterExternalSecret |
| clusterExternalSecret[0].externalSecretSpec | object | [] | The [spec](https://external-secrets.io/latest/api/spec/#external-secrets.io/v1beta1.ExternalSecretSpec) for the ExternalSecrets to be created |
| clusterExternalSecret[0].externalSecretSpec.data | list | `[]` | *(optional)* [Data](https://external-secrets.io/latest/api/spec/#external-secrets.io/v1beta1.ExternalSecretData) defines the connection between the Kubernetes Secret keys and the Provider data |
| clusterExternalSecret[0].externalSecretSpec.dataFrom | list | `[]` | *(optional)* [DataFrom](https://external-secrets.io/latest/api/spec/#external-secrets.io/v1beta1.ExternalSecretDataFromRemoteRef) is used to fetch all properties from a specific Provider data If multiple entries are specified, the Secret keys are merged in the specified order |
| clusterExternalSecret[0].externalSecretSpec.refreshInterval | string | `""` | [RefreshInterval](https://external-secrets.io/latest/api/spec/#external-secrets.io/v1beta1.ExternalSecret) is the amount of time before the values are read again from the SecretStore provider Valid time units are “ns”, “us” (or “µs”), “ms”, “s”, “m”, “h” May be set to zero to fetch and create it once. Defaults to 1h. |
| clusterExternalSecret[0].externalSecretSpec.secretStoreRef | optional | `[]` | - [SecretStoreRef](https://external-secrets.io/latest/api/spec/#external-secrets.io/v1beta1.ExternalSecretSpec) defines which SecretStore to fetch the ExternalSecret data. |
| clusterExternalSecret[0].externalSecretSpec.target | list | `[]` | [ExternalSecretTarget](https://external-secrets.io/latest/api/spec/#external-secrets.io/v1beta1.ExternalSecretTarget) defines the Kubernetes Secret to be created There can be only one target per ExternalSecret. |
| clusterExternalSecret[0].name | string | `""` | defines k8s [`metadata.name`](https://kubernetes.io/docs/reference/kubernetes-api/common-definitions/object-meta/#ObjectMeta) value of `kind: ExternalSecret` |
| clusterExternalSecret[0].namespaceSelectors | list | `[]` | *(optional)* [namespaceSelectors](https://external-secrets.io/latest/api/spec/#external-secrets.io/v1beta1.ClusterExternalSecretSpec) defines a list of labels to select by to find the Namespaces to create the ExternalSecrets in. The selectors are ORed. |
| clusterExternalSecret[0].refreshTime | string | `""` | [refreshTime](https://external-secrets.io/latest/api/spec/#external-secrets.io/v1beta1.ClusterExternalSecretSpec) is the  time in which the controller should reconcile its objects and recheck namespaces for labels. |
| clusterSecretStores[0].controller | string | `""` | *(optional)* Used to select the correct ESO controller (think: ingress.ingressClassName) The ESO controller is instantiated with a specific controller name and filters ES based on this property |
| clusterSecretStores[0].name | string | `""` | defines k8s [`metadata.name`](https://kubernetes.io/docs/reference/kubernetes-api/common-definitions/object-meta/#ObjectMeta) value of `kind: ClusterSecretStore` |
| clusterSecretStores[0].provider | object | [] | Used to configure the [provider](https://external-secrets.io/latest/api/spec/#external-secrets.io/v1beta1.SecretStoreSpec). Only one provider may be set. |
| clusterSecretStores[0].provider.vault | object | [] | *(optional)* [Vault](https://external-secrets.io/latest/api/spec/#external-secrets.io/v1beta1.SecretStoreProvider) configures this store to sync secrets using Hashi provider |
| clusterSecretStores[0].provider.vault.auth | object | [] | [Auth](https://external-secrets.io/latest/api/spec/#external-secrets.io/v1beta1.VaultProvider) configures how secret-manager authenticates with the Vault server. |
| clusterSecretStores[0].provider.vault.auth.appRole | object | [] | *(optional)* [appRole](https://external-secrets.io/latest/api/spec/#external-secrets.io/v1beta1.VaultAuth) authenticates with Vault using the App Role auth mechanism, with the role and secret stored in a Kubernetes Secret resource.  VaultAppRole authenticates with Vault using the [App Role auth mechanism](https://www.vaultproject.io/docs/auth/approle). |
| clusterSecretStores[0].provider.vault.auth.appRole.path | string | `"approle"` | [Path](https://external-secrets.io/latest/api/spec/#external-secrets.io/v1beta1.VaultAppRole) where the App Role authentication backend is mounted in Vault, e.g: “approle” |
| clusterSecretStores[0].provider.vault.auth.appRole.roleId | string | `""` | *(optional)* [roleId](https://external-secrets.io/latest/api/spec/#external-secrets.io/v1beta1.VaultAppRole) configured in the App Role authentication backend when setting up the authentication backend in Vault. |
| clusterSecretStores[0].provider.vault.auth.appRole.secretRef.key | string | `""` | [`type SecretKeySelector `](https://pkg.go.dev/github.com/external-secrets/external-secrets/apis/meta/v1#SecretKeySelector) |
| clusterSecretStores[0].provider.vault.auth.appRole.secretRef.name | string | `""` | [`type SecretKeySelector `](https://pkg.go.dev/github.com/external-secrets/external-secrets/apis/meta/v1#SecretKeySelector) |
| clusterSecretStores[0].provider.vault.namespace | string | `"ns1"` | *(optional)* Name of the [vault namespace](https://external-secrets.io/latest/api/spec/#external-secrets.io/v1beta1.VaultProvider). Namespaces is a set of features within Vault Enterprise that allows Vault environments to support Secure Multi-tenancy. e.g: “ns1”. More about namespaces can be found here https://www.vaultproject.io/docs/enterprise/namespaces. E.g. "ns1" |
| clusterSecretStores[0].provider.vault.path | string | `""` | *(optional)* [Path](https://external-secrets.io/latest/api/spec/#external-secrets.io/v1beta1.VaultProvider) is the mount path of the Vault KV backend endpoint, e.g: “secret”. The v2 KV secret engine version specific “/data” path suffix for fetching secrets from Vault is optional and will be appended if not present in specified path. |
| clusterSecretStores[0].provider.vault.server | string | `"https://vault.example/"` | [Server](https://external-secrets.io/latest/api/spec/#external-secrets.io/v1beta1.VaultProvider) is the connection address for the Vault server, e.g: "https://vault.example/". |
| clusterSecretStores[0].provider.vault.version | string | `"v2"` | [Version](https://external-secrets.io/latest/api/spec/#external-secrets.io/v1beta1.VaultProvider) is the Vault KV secret engine version. This can be either “v1” or “v2”. Version defaults to “v2”. |
| credentials[0].data | list | `[]` | *(optional)* [data](https://kubernetes.io/docs/reference/kubernetes-api/config-and-storage-resources/secret-v1/) *(map[string][]byte)* Data contains the secret data. Each key must consist of alphanumeric characters, '-', '_' or '.'. The serialized form of the secret data is a base64 encoded string, representing the arbitrary (possibly non-string) data value here. Described in https://tools.ietf.org/html/rfc4648#section-4 |
| credentials[0].name | string | `""` | defines k8s `metadata.name` value of `kind: Secret` |
| credentials[0].namespace | string | `"ns1"` | *(optional)* defines k8s [`metadata.namespace`](https://kubernetes.io/docs/reference/kubernetes-api/common-definitions/object-meta/#ObjectMeta) value of `kind: Secret` |
| credentials[0].stringData | list | `[]` | *(optional)* [stringData](https://kubernetes.io/docs/reference/kubernetes-api/config-and-storage-resources/secret-v1/) *(map[string]string)* allows specifying non-binary secret data in string form. It is provided as a write-only input field for convenience. All keys and values are merged into the data field on write, overwriting any existing values. The stringData field is never output when reading from the API. |
| defaults.externalSecret.secretStoreRef.kind | string | `"SecretStore"` |  |
| defaults.namespace | string | `"default"` | default namespace value for optional `namespace` fields. |
| externalSecret | list | {} | [ExternalSecret](https://external-secrets.io/latest/api/spec/#external-secrets.io/v1beta1.ExternalSecret) is the Schema for the external-secrets API. |
| externalSecret[0].creationPolicy | string | `""` | *(optional)* CreationPolicy defines rules on how to create the resulting Secret Defaults to ‘Owner’ |
| externalSecret[0].data | list | [] | *(optional)* [Data](https://external-secrets.io/latest/api/spec/#external-secrets.io/v1beta1.ExternalSecret) defines the connection between the Kubernetes Secret keys and the Provider data |
| externalSecret[0].data[0].remoteRef | object | `{"key":"","property":""}` | [RemoteRef](https://external-secrets.io/latest/api/spec/#external-secrets.io/v1beta1.ExternalSecretData) points to the remote secret and defines which secret (version/property/..) to fetch. |
| externalSecret[0].data[0].remoteRef.key | string | `""` | [Key](https://external-secrets.io/latest/api/spec/#external-secrets.io/v1beta1.ExternalSecretDataRemoteRef) is the key used in the Provider, mandatory. E.g. "btp-endpoint.example/btp-account" |
| externalSecret[0].data[0].remoteRef.property | string | `""` | *(optional)* Used to select a [specific property](https://external-secrets.io/latest/api/spec/#external-secrets.io/v1beta1.ExternalSecretDataRemoteRef) of the Provider value (if a map), if supported. E.g. "kubeconfig" |
| externalSecret[0].deletionPolicy | string | `""` | *(optional)* DeletionPolicy defines rules on how to delete the resulting Secret Defaults to ‘Retain’ |
| externalSecret[0].immutable | bool | `false` | *(optional)* Immutable defines if the final secret will be immutable |
| externalSecret[0].name | string | `""` | defines k8s [`metadata.name`](https://kubernetes.io/docs/reference/kubernetes-api/common-definitions/object-meta/#ObjectMeta) value of `kind: ExternalSecret` |
| externalSecret[0].namespace | string | `"ns1"` | *(optional)* defines k8s [`metadata.namespace`](https://kubernetes.io/docs/reference/kubernetes-api/common-definitions/object-meta/#ObjectMeta) value of `kind: ExternalSecret` |
| externalSecret[0].refreshInterval | string | `""` | [RefreshInterval](https://external-secrets.io/latest/api/spec/#external-secrets.io/v1beta1.ExternalSecret) is the amount of time before the values are read again from the SecretStore provider Valid time units are “ns”, “us” (or “µs”), “ms”, “s”, “m”, “h” May be set to zero to fetch and create it once. Defaults to 1h. |
| externalSecret[0].secretStore | object | `{"kind":"","name":""}` | [SecretStoreRef](https://external-secrets.io/latest/api/spec/#external-secrets.io/v1beta1.SecretStoreRef) defines which SecretStore to fetch the ExternalSecret data. |
| externalSecret[0].secretStore.kind | string | `""` | *(optional)* Kind of the SecretStore resource (`SecretStore` or `ClusterSecretStore`) Defaults to `.Values.defaults.externalSecret.secretStoreRef.kind` |
| externalSecret[0].secretStore.name | string | `""` | Name of the SecretStore resource |
| externalSecret[0].targetSecretName | string | `""` | [targetSecretName](https://external-secrets.io/latest/api/spec/#external-secrets.io/v1beta1.ExternalSecretTarget) defines the name of the Secret resource to be managed This field is immutable Defaults to the .metadata.name of the ExternalSecret resource |
| externalSecret[0].template | list | `[]` | *(optional)* [Template](https://external-secrets.io/latest/api/spec/#external-secrets.io/v1beta1.ExternalSecretTemplate) defines a blueprint for the created Secret resource. |
| pushSecrets | list | {} | The [PushSecret](https://external-secrets.io/latest/api/pushsecret/) is namespaced and it describes what data should be pushed to the secret provider. - tells the operator what secrets should be pushed by using spec.selector. - you can specify what secret keys should be pushed by using spec.data. |
| pushSecrets[0].spec.data | list | `[]` | Secret Data that should be pushed to providers |
| pushSecrets[0].spec.deletionPolicy | string | `""` | *optional* The provider' secret will be deleted if the PushSecret is deleted. E.g. Delete |
| pushSecrets[0].spec.refreshInterval | string | `""` | Refresh interval for which push secret will reconcile. E.g. 1h |
| pushSecrets[0].spec.secretStoreRefs | object | `{}` | A list of secret stores to push secrets to. |
| pushSecrets[0].spec.selector | list | `[]` | The Secret Selector (k8s source) for the Push Secret       |
| pushSecrets[0].spec.template | list | `[]` | *optional* Template defines a blueprint for the created Secret resource. |
| pushSecrets[0].spec.updatePolicy | string | `""` | *optional* Policy to overwrite existing secrets in the provider on sync. E.g. Replace  |
| secretStores[0].name | string | `""` | defines k8s [`metadata.name`](https://kubernetes.io/docs/reference/kubernetes-api/common-definitions/object-meta/#ObjectMeta) value of `kind: SecretStore` |
| secretStores[0].namespace | string | `"ns1"` | *(optional)* defines k8s [`metadata.namespace`](https://kubernetes.io/docs/reference/kubernetes-api/common-definitions/object-meta/#ObjectMeta) value of `kind: SecretStore` |
| secretStores[0].provider | object | [] | Used to configure the [provider](https://external-secrets.io/latest/api/spec/#external-secrets.io/v1beta1.SecretStoreSpec). Only one provider may be set. |
| secretStores[0].provider.vault | object | [] | *(optional)* [Vault](https://external-secrets.io/latest/api/spec/#external-secrets.io/v1beta1.SecretStoreProvider) configures this store to sync secrets using Hashi provider |
| secretStores[0].provider.vault.auth | object | [] | [Auth](https://external-secrets.io/latest/api/spec/#external-secrets.io/v1beta1.VaultProvider) configures how secret-manager authenticates with the Vault server. |
| secretStores[0].provider.vault.auth.appRole | object | [] | *(optional)* [appRole](https://external-secrets.io/latest/api/spec/#external-secrets.io/v1beta1.VaultAuth) authenticates with Vault using the App Role auth mechanism, with the role and secret stored in a Kubernetes Secret resource.  VaultAppRole authenticates with Vault using the [App Role auth mechanism](https://www.vaultproject.io/docs/auth/approle). |
| secretStores[0].provider.vault.auth.appRole.path | string | `"approle"` | [Path](https://external-secrets.io/latest/api/spec/#external-secrets.io/v1beta1.VaultAppRole) where the App Role authentication backend is mounted in Vault, e.g: “approle” |
| secretStores[0].provider.vault.auth.appRole.roleId | string | `""` | *(optional)* [roleId](https://external-secrets.io/latest/api/spec/#external-secrets.io/v1beta1.VaultAppRole) configured in the App Role authentication backend when setting up the authentication backend in Vault. |
| secretStores[0].provider.vault.auth.appRole.secretRef.key | string | `""` | [`type SecretKeySelector `](https://pkg.go.dev/github.com/external-secrets/external-secrets/apis/meta/v1#SecretKeySelector) |
| secretStores[0].provider.vault.auth.appRole.secretRef.name | string | `""` | [`type SecretKeySelector `](https://pkg.go.dev/github.com/external-secrets/external-secrets/apis/meta/v1#SecretKeySelector) |
| secretStores[0].provider.vault.namespace | string | `"ns1"` | *(optional)* Name of the [vault namespace](https://external-secrets.io/latest/api/spec/#external-secrets.io/v1beta1.VaultProvider). Namespaces is a set of features within Vault Enterprise that allows Vault environments to support Secure Multi-tenancy. e.g: “ns1”. More about namespaces can be found here https://www.vaultproject.io/docs/enterprise/namespaces. E.g. "ns1" |
| secretStores[0].provider.vault.path | string | `""` | *(optional)* [Path](https://external-secrets.io/latest/api/spec/#external-secrets.io/v1beta1.VaultProvider) is the mount path of the Vault KV backend endpoint, e.g: “secret”. The v2 KV secret engine version specific “/data” path suffix for fetching secrets from Vault is optional and will be appended if not present in specified path. |
| secretStores[0].provider.vault.server | string | `""` | [Server](https://external-secrets.io/latest/api/spec/#external-secrets.io/v1beta1.VaultProvider) is the connection address for the Vault server, e.g: "https://vault.example/". |
| secretStores[0].provider.vault.version | string | `"v2"` | [Version](https://external-secrets.io/latest/api/spec/#external-secrets.io/v1beta1.VaultProvider) is the Vault KV secret engine version. This can be either “v1” or “v2”. Version defaults to “v2”. |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)