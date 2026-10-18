

# crossplane-gardener-core-cloud

![Version: 0.0.8](https://img.shields.io/badge/Version-0.0.8-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.127.0](https://img.shields.io/badge/AppVersion-1.127.0-informational?style=flat-square)

A Helm chart to template crossplane manifests to manage core.gardener.cloud resources.

**Homepage:** <https://gardener.cloud/docs/gardener/api-reference/core/#core.gardener.cloud/v1beta1>

## Source Code

* <https://github.com/gardener/gardener>
* <https://gardener.cloud/docs/gardener/api-reference/core/#core.gardener.cloud/v1beta1.SecretBinding>
* <https://gardener.cloud/docs/gardener/api-reference/security/#security.gardener.cloud/v1alpha1.CredentialsBinding>
* <https://github.com/crossplane-contrib/provider-kubernetes>
* <https://doc.crds.dev/github.com/crossplane-contrib/provider-kubernetes/kubernetes.crossplane.io/Object/v1alpha1>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| credentialsBindings | list | [] | `credentialsBindings[]` orchestrate [`kind: CredentialsBinding`](https://gardener.cloud/docs/gardener/api-reference/security/#security.gardener.cloud/v1alpha1.CredentialsBinding)    to bind cloud provider credentials to Gardener Shoots via crossplane provider-kubernetes Object.    Replaces the deprecated SecretBinding. **Required for Shoots on Kubernetes >= 1.34.** |
| credentialsBindings[0].cloudProfile | string | `""` | cloudProfile: provider type, e.g. aws / gcp / azure (immutable) |
| credentialsBindings[0].credentialsBindingName | string | `""` | credentialsBindingName: technical name of the CredentialsBinding in the Gardener project |
| credentialsBindings[0].credentialsRef | object | `{"apiVersion":"v1","kind":"Secret","name":"","namespace":""}` | credentialsRef: reference to the credentials object (Secret, InternalSecret, or WorkloadIdentity)    See https://gardener.cloud/docs/gardener/api-reference/security/#security.gardener.cloud/v1alpha1.CredentialsBindingSpec |
| credentialsBindings[0].kubernetesCrossplaneProviderConfigRefName | string | `""` | kubernetesCrossplaneProviderConfigRefName: matches crossplane Kubernetes ProviderConfig for the garden cluster |
| credentialsBindings[0].labels | object | `{}` | labels: additional labels to add to the CredentialsBinding metadata |
| credentialsBindings[0].projectNamespace | string | `""` | projectNamespace: Gardener project namespace, e.g. "garden-aas-dt" |
| credentialsBindings[0].quotas | list | `[]` | quotas: (Optional) list of Quota object references (immutable) |
| secretBindings | list | - | [secretBindings](https://gardener.cloud/docs/gardener/api-reference/core/#core.gardener.cloud/v1beta1.SecretBinding) represents a binding to a secret in the same or another namespace via [crossplane provider kubernetes](https://marketplace.upbound.io/providers/crossplane-contrib/provider-kubernetes/v0.10.0). |
| secretBindings[0].cloudProfile | string | `""` | cloudProfile is a name (field `type`) of a [CloudProfile object](https://github.com/gardener/gardener/blob/master/docs/api-reference/core.md#cloudprofile). This field is immutable. E.g. gcp / azure / aws |
| secretBindings[0].kubernetesCrossplaneProviderConfigRefName | string | `""` | kubernetesCrossplaneProviderConfigRefName needs to match crossplane provider configuration reference name (identifier) of SAP garden cluster control plane! (.shootClusters[*].kubernetesCrossplaneProviderConfigRefName) |
| secretBindings[0].labels | list | `[]` | [labels](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.27/#objectmeta-v1-meta) Map of string keys and values that can be used to organize and categorize (scope and select) objects. May match selectors of replication controllers and services. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/labels |
| secretBindings[0].name | string | `""` | name defines technical gardener shoot cluster. Max length 15 and must only be lowercase letters, numbers and hyphens! |
| secretBindings[0].projectNamespace | string | `"ns1"` | gardener project name. Starts with "garden..." e.g. "garden-aas-dt" |
| secretBindings[0].quotas | object | `{}` | *(Optional)* [quotas](https://gardener.cloud/docs/gardener/api-reference/core/#core.gardener.cloud/v1beta1.SecretBinding)  is a list of references to Quota objects in the same or another namespace. This field is immutable. |
| secretBindings[0].secretBindingName | string | `""` | secretBindingName defines the technical name of [infrastructure secret](https://gardener.cloud/docs/gardener/development/secrets_management/) binding on gardener control plane cluster. e.g. [Secrets of AAS-DT](https://dashboard.garden.canary.k8s.ondemand.com/namespace/garden-aas-dt/secrets) |
| secretBindings[0].secretRef | list | `[]` | [secretRef](https://gardener.cloud/docs/gardener/api-reference/core/#core.gardener.cloud/v1beta1.SecretBinding) is a reference to a secret object in the same or another namespace. This field is immutable. |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)