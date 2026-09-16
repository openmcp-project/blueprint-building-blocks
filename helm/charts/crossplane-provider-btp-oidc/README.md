
# crossplane-provider-btp-oidc

![Version: 0.0.1](https://img.shields.io/badge/Version-0.0.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.13.0](https://img.shields.io/badge/AppVersion-1.13.0-informational?style=flat-square)

A Helm Chart to template BTP OIDC manifests for its crossplane provider (oidc.btp.sap.crossplane.io).

**Homepage:** <https://github.com/openmcp-project/blueprints>

## Source Code

* <https://github.com/SAP/crossplane-provider-btp>
* <https://doc.crds.dev/github.com/SAP/crossplane-provider-btp/oidc.btp.sap.crossplane.io/CertBasedOIDCLogin/v1alpha1@v1.13.0>
* <https://doc.crds.dev/github.com/SAP/crossplane-provider-btp/oidc.btp.sap.crossplane.io/KubeConfigGenerator/v1alpha1@v1.13.0>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| certBasedOIDCLogins | list | object | `certBasedOIDCLogins[].` orchestrate `kind: CertBasedOIDCLogin` for BTP OIDC certificate-based login flows. |
| certBasedOIDCLogins[0].name | string | - | Name of the CertBasedOIDCLogin resource. |
| certBasedOIDCLogins[0].btpSapCrossplaneProviderConfigRefName | string | `""` | Crossplane provider configuration reference name. |
| certBasedOIDCLogins[0].forProvider | object | `[]` | CRD forProvider spec. |
| certBasedOIDCLogins[0].writeConnectionSecretToRef | object | `[]` | optional writeConnectionSecretToRef. |
| kubeConfigGenerators | list | object | `kubeConfigGenerators[].` orchestrate `kind: KubeConfigGenerator` for BTP OIDC kubeconfig generation. |
| kubeConfigGenerators[0].name | string | - | Name of the KubeConfigGenerator resource. |
| kubeConfigGenerators[0].btpSapCrossplaneProviderConfigRefName | string | `""` | Crossplane provider configuration reference name. |
| kubeConfigGenerators[0].forProvider | object | `[]` | CRD forProvider spec. |
| kubeConfigGenerators[0].writeConnectionSecretToRef | object | `[]` | optional writeConnectionSecretToRef. |
