

# crossplane-provider-pkgs

![Version: 0.0.13](https://img.shields.io/badge/Version-0.0.13-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.0.1](https://img.shields.io/badge/AppVersion-0.0.1-informational?style=flat-square)

A Helm Chart to template crossplane provider "kind Provider" manifests to install crossplane family providers.

**Homepage:** <https://github.com/openmcp-project/blueprints>

## Source Code

* <https://github.com/openmcp-project/blueprint-building-blocks>
* <https://docs.upbound.io/providers/>
* <https://docs.upbound.io/providers/provider-families/>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| configurations | list | list | A [Configuration](https://docs.crossplane.io/latest/concepts/packages/) package is an [OCI container images](https://opencontainers.org/) containing a collection of [Compositions](https://docs.crossplane.io/latest/concepts/compositions/), [Composite Resource Definitions](https://docs.crossplane.io/latest/concepts/composite-resource-definitions/) and any required [Providers](https://docs.crossplane.io/latest/concepts/providers/) or [Functions](https://docs.crossplane.io/latest/concepts/compositions/). |
| configurations[0].name | string | `""` | kubernetes crossplane object `metadata.name` on managed control plane. |
| configurations[0].spec | list | [] | [spec](https://docs.crossplane.io/latest/api/#Configuration-spec) defines plain kubernetes [manifest](https://monokle.io/learn/kubernetes-manifest-files-explained). |
| deploymentRuntimeConfigs | list | list | The [DeploymentRuntimeConfig](https://docs.crossplane.io/latest/api/) provides settings for the Kubernetes Deployment of a Provider or composition function package. Read the Crossplane documentation for [more information about DeploymentRuntimeConfigs](https://docs.crossplane.io/latest/concepts/providers/#runtime-configuration). |
| deploymentRuntimeConfigs[0].name | string | `""` | kubernetes crossplane object `metadata.name` on managed control plane. |
| deploymentRuntimeConfigs[0].spec | list | [] | [spec/DeploymentRuntimeConfigSpec](https://docs.crossplane.io/latest/api/#DeploymentRuntimeConfig-spec) specifies the configuration for a packaged controller. Values provided will override package manager defaults. Labels and annotations are passed to both the controller Deployment and ServiceAccount. |
| functions[0].name | string | `""` | kubernetes crossplane object `metadata.name` on managed control plane. |
| functions[0].spec | list | [] | [spec](https://docs.crossplane.io/latest/api/#Function-spec) defines plain kubernetes [manifest](https://monokle.io/learn/kubernetes-manifest-files-explained). |
| imageConfigs | list | list | The [ImageConfig](https://docs.crossplane.io/latest/concepts/image-configs/) resource is used to configure settings for package images. |
| imageConfigs[0].name | string | `""` | kubernetes crossplane object `metadata.name` on managed control plane. |
| imageConfigs[0].spec | object | [] | [spec/ImageConfigSpec](https://docs.crossplane.io/latest/api/#ImageConfig-spec) contains the configuration for matching images. |
| imageConfigs[0].spec.matchImages | list | [] | ImageMatch defines a rule for matching image. |
| imageConfigs[0].spec.matchImages[0].prefix | string | `""` | Prefix is the prefix that should be matched. (Default `Prefix``) |
| imageConfigs[0].spec.matchImages[0].type | string | `"Prefix"` | Type is the type of match.  |
| imageConfigs[0].spec.registry | object | [] | Registry is the configuration for the registry. |
| imageConfigs[0].spec.registry.authentication | object | [] | Authentication is the authentication information for the registry. |
| imageConfigs[0].spec.registry.authentication.pullSecretRef | list | `[]` | PullSecretRef is a reference to a secret that contains the credentials for the registry. |
| imageConfigs[0].spec.verification | object | [] | Verification contains the configuration for verifying the image. |
| imageConfigs[0].spec.verification.cosign | object | [] | Cosign is the configuration for verifying the image using cosign. |
| imageConfigs[0].spec.verification.cosign.authorities | list | {} | Authority defines the rules for discovering and validating signatures. |
| imageConfigs[0].spec.verification.cosign.authorities[0].attestations | list | {} | Attestation defines the type of attestation to validate and optionally apply a policy decision to it. Authority block is used to verify the specified attestation types, and if Policy is specified, then it’s applied only after the validation of the Attestation signature has been verified. |
| imageConfigs[0].spec.verification.cosign.authorities[0].attestations[0].name | string | `""` | Name of the attestation. |
| imageConfigs[0].spec.verification.cosign.authorities[0].key | object | [] | Key defines the type of key to validate the image. |
| imageConfigs[0].spec.verification.cosign.authorities[0].key.hashAlgorithm | string | `""` | HashAlgorithm always defaults to sha256 if the algorithm hasn’t been explicitly set |
| imageConfigs[0].spec.verification.cosign.authorities[0].key.secretRef | list | `[]` | SecretRef sets a reference to a secret with the key. |
| imageConfigs[0].spec.verification.cosign.authorities[0].keyless | object | [] | Keyless sets the configuration to verify the authority against a Fulcio instance. |
| imageConfigs[0].spec.verification.cosign.authorities[0].keyless.identities | list | {} | Identity may contain the issuer and/or the subject found in the transparency log. Issuer/Subject uses a strict match, while IssuerRegExp and SubjectRegExp apply a regexp for matching. |
| imageConfigs[0].spec.verification.cosign.authorities[0].keyless.identities[0].issuer | string | `""` | Issuer defines the issuer for this identity. |
| imageConfigs[0].spec.verification.cosign.authorities[0].keyless.identities[0].issuerRegExp | string | `""` | IssuerRegExp specifies a regular expression to match the issuer for this identity. This has precedence over the Issuer field. |
| imageConfigs[0].spec.verification.cosign.authorities[0].keyless.identities[0].subject | string | `""` | Subject defines the subject for this identity. |
| imageConfigs[0].spec.verification.cosign.authorities[0].keyless.identities[0].subjectRegExp | string | `""` | SubjectRegExp specifies a regular expression to match the subject for this identity. This has precedence over the Subject field. |
| imageConfigs[0].spec.verification.cosign.authorities[0].name | string | {} | Name is the name for this authority. |
| providers | list | list | [providers](https://docs.crossplane.io/latest/concepts/providers/) contains information and configuration of k8s [manifest/resource](https://kubernetes.io/docs/concepts/cluster-administration/manage-deployment/). Learn more with this [example](../../../../argo-cd-generator-config/remote-clusters-temp/template/template.aas-dt.shoot.canary.k8s-hana.ondemand.com.yaml.file). |
| providers[0].name | string | `""` | kubernetes crossplane object `metadata.name` on managed control plane. |
| providers[0].spec | list | [] | [spec](https://docs.crossplane.io/latest/api/#Provider-spec) defines plain kubernetes [manifest](https://monokle.io/learn/kubernetes-manifest-files-explained). |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)