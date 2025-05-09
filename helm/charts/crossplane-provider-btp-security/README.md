

# crossplane-provider-btp-security

![Version: 0.0.14](https://img.shields.io/badge/Version-0.0.14-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.0.1](https://img.shields.io/badge/AppVersion-0.0.1-informational?style=flat-square)

A Helm Chart to template crossplane manifests to manage BTP resources such as Directory, TrustConfiguration and RoleCollection Assignment on BTP.

**Homepage:** <https://github.com/openmcp-project/blueprints>

## Source Code

* <https://github.com/openmcp-project/blueprint-building-blocks>
* <https://pages.github.tools.sap/cloud-orchestration/browser/Providers/provider-btp-account>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| globalaccountTrustConfigurations | list | object | `globalaccountTrustConfigurations[].` orchestrate [`kind: GlobalaccountTrustConfiguration`](https://pages.github.tools.sap/cloud-orchestration/browser/Providers/provider-btp-account/security.btp.sap.crossplane.io/globalaccounttrustconfiguration/v1alpha1) of [BTP Accounts](https://pages.github.tools.sap/cloud-orchestration/docs/category/account-management). |
| globalaccountTrustConfigurations[0] | object | `{"btpSapCrossplaneProviderConfigRefName":"","forProvider":[],"name":"","writeConnectionSecretToRef":[]}` | btpSapCrossplaneProviderConfigRefName defines crossplane provider configuration reference name (identifier) of a [BTP Global Account](https://help.sap.com/docs/btp/sap-business-technology-platform/getting-global-account)! |
| globalaccountTrustConfigurations[0].forProvider | list | `[]` | [forProvider](https://pages.github.tools.sap/cloud-orchestration/browser/Providers/provider-btp-account/security.btp.sap.crossplane.io/globalaccounttrustconfiguration/v1alpha1) CRD |
| globalaccountTrustConfigurations[0].name | string | - | Name of the GlobalaccountTrustConfiguration resource - [CRD Browser](https://pages.github.tools.sap/cloud-orchestration/browser/Providers/provider-btp-account/security.btp.sap.crossplane.io/globalaccounttrustconfiguration/v1alpha1?path=metadata). |
| globalaccountTrustConfigurations[0].writeConnectionSecretToRef | list | `[]` | optional |
| roleCollectionAssignments | list | object | `roleCollectionAssignments[].` orchestrate [`kind: RoleCollectionAssignment`](https://pages.github.tools.sap/cloud-orchestration/browser/Providers/provider-btp-account/security.btp.sap.crossplane.io/rolecollectionassignment/v1alpha1) of [BTP Accounts](https://pages.github.tools.sap/cloud-orchestration/docs/category/account-management). |
| roleCollectionAssignments[0] | object | `{"apiCredentials":[],"btpSapCrossplaneProviderConfigRefName":"","forProvider":[],"name":"","writeConnectionSecretToRef":[]}` | btpSapCrossplaneProviderConfigRefName defines crossplane provider configuration reference name (identifier) of a [BTP Global Account](https://help.sap.com/docs/btp/sap-business-technology-platform/getting-global-account)! |
| roleCollectionAssignments[0].apiCredentials | list | `[]` | [apiCredentials](https://pages.github.tools.sap/cloud-orchestration/browser/Providers/provider-btp-account/security.btp.sap.crossplane.io/rolecollectionassignment/v1alpha1) CRD |
| roleCollectionAssignments[0].forProvider | list | `[]` | [forProvider](https://pages.github.tools.sap/cloud-orchestration/browser/Providers/provider-btp-account/security.btp.sap.crossplane.io/rolecollectionassignment/v1alpha1) CRD |
| roleCollectionAssignments[0].name | string | - | Name of the RoleCollectionAssignment resource - [CRD Browser](https://pages.github.tools.sap/cloud-orchestration/browser/Providers/provider-btp-account/security.btp.sap.crossplane.io/rolecollectionassignment/v1alpha1?path=metadata). |
| roleCollectionAssignments[0].writeConnectionSecretToRef | list | `[]` | optional |
| subaccountTrustConfigurations | list | object | `subaccountTrustConfigurations[].` orchestrate [`kind: SubaccountTrustConfiguration`](https://pages.github.tools.sap/cloud-orchestration/browser/Providers/provider-btp-account/security.btp.sap.crossplane.io/subaccounttrustconfiguration/v1alpha1) of [BTP Accounts](https://pages.github.tools.sap/cloud-orchestration/docs/category/account-management). |
| subaccountTrustConfigurations[0] | object | `{"btpSapCrossplaneProviderConfigRefName":"","forProvider":[],"name":"","writeConnectionSecretToRef":[]}` | btpSapCrossplaneProviderConfigRefName defines crossplane provider configuration reference name (identifier) of a [BTP Global Account](https://help.sap.com/docs/btp/sap-business-technology-platform/getting-global-account)! |
| subaccountTrustConfigurations[0].forProvider | list | `[]` | [forProvider](https://pages.github.tools.sap/cloud-orchestration/browser/Providers/provider-btp-account/security.btp.sap.crossplane.io/subaccounttrustconfiguration/v1alpha1) CRD |
| subaccountTrustConfigurations[0].name | string | - | Name of the SubaccountTrustConfiguration resource - [CRD Browser](https://pages.github.tools.sap/cloud-orchestration/browser/Providers/provider-btp-account/security.btp.sap.crossplane.io/subaccounttrustconfiguration/v1alpha1?path=metadata). |
| subaccountTrustConfigurations[0].writeConnectionSecretToRef | list | `[]` | optional |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)