

# crossplane-provider-btp-security

![Version: 0.0.15](https://img.shields.io/badge/Version-0.0.15-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.1.2](https://img.shields.io/badge/AppVersion-1.1.2-informational?style=flat-square)

A Helm Chart to template crossplane manifests to manage BTP resources such as Directory, TrustConfiguration and RoleCollection Assignment on BTP.

**Homepage:** <https://github.com/openmcp-project/blueprints>

## Source Code

* <https://github.com/openmcp-project/blueprint-building-blocks>
* <https://github.com/SAP/crossplane-provider-btp>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| globalaccountTrustConfigurations | list | object | `globalaccountTrustConfigurations[].` orchestrate [`kind: GlobalaccountTrustConfiguration`](https://doc.crds.dev/github.com/SAP/crossplane-provider-btp/security.btp.sap.crossplane.io/GlobalaccountTrustConfiguration/v1alpha1@v1.1.2) of [BTP Accounts](https://help.sap.com/docs/btp/sap-business-technology-platform/account-model). |
| globalaccountTrustConfigurations[0] | object | `{"btpSapCrossplaneProviderConfigRefName":"","forProvider":[],"name":"","writeConnectionSecretToRef":[]}` | btpSapCrossplaneProviderConfigRefName defines crossplane provider configuration reference name (identifier) of a [BTP Global Account](https://help.sap.com/docs/btp/sap-business-technology-platform/getting-global-account)! |
| globalaccountTrustConfigurations[0].forProvider | list | `[]` | [forProvider](https://doc.crds.dev/github.com/SAP/crossplane-provider-btp/security.btp.sap.crossplane.io/GlobalaccountTrustConfiguration/v1alpha1@v1.1.2) CRD |
| globalaccountTrustConfigurations[0].name | string | - | Name of the GlobalaccountTrustConfiguration resource - [CRD Browser](https://doc.crds.dev/github.com/SAP/crossplane-provider-btp/security.btp.sap.crossplane.io/GlobalaccountTrustConfiguration/v1alpha1@v1.1.2?path=metadata). |
| globalaccountTrustConfigurations[0].writeConnectionSecretToRef | list | `[]` | optional |
| roleCollectionAssignments | list | object | `roleCollectionAssignments[].` orchestrate [`kind: RoleCollectionAssignment`](https://doc.crds.dev/github.com/SAP/crossplane-provider-btp/security.btp.sap.crossplane.io/RoleCollectionAssignment/v1alpha1@v1.1.2) of [BTP Accounts](https://help.sap.com/docs/btp/sap-business-technology-platform/account-model). |
| roleCollectionAssignments[0] | object | `{"apiCredentials":[],"btpSapCrossplaneProviderConfigRefName":"","forProvider":[],"name":"","writeConnectionSecretToRef":[]}` | btpSapCrossplaneProviderConfigRefName defines crossplane provider configuration reference name (identifier) of a [BTP Global Account](https://help.sap.com/docs/btp/sap-business-technology-platform/getting-global-account)! |
| roleCollectionAssignments[0].apiCredentials | list | `[]` | [apiCredentials](https://doc.crds.dev/github.com/SAP/crossplane-provider-btp/security.btp.sap.crossplane.io/RoleCollectionAssignment/v1alpha1@v1.1.2) CRD |
| roleCollectionAssignments[0].forProvider | list | `[]` | [forProvider](https://doc.crds.dev/github.com/SAP/crossplane-provider-btp/security.btp.sap.crossplane.io/RoleCollectionAssignment/v1alpha1@v1.1.2) CRD |
| roleCollectionAssignments[0].name | string | - | Name of the RoleCollectionAssignment resource - [CRD Browser](https://doc.crds.dev/github.com/SAP/crossplane-provider-btp/security.btp.sap.crossplane.io/RoleCollectionAssignment/v1alpha1@v1.1.2?path=metadata). |
| roleCollectionAssignments[0].writeConnectionSecretToRef | list | `[]` | optional |
| subaccountTrustConfigurations | list | object | `subaccountTrustConfigurations[].` orchestrate [`kind: SubaccountTrustConfiguration`](https://doc.crds.dev/github.com/SAP/crossplane-provider-btp/security.btp.sap.crossplane.io/SubaccountTrustConfiguration/v1alpha1@v1.1.2) of [BTP Accounts](https://help.sap.com/docs/btp/sap-business-technology-platform/account-model). |
| subaccountTrustConfigurations[0] | object | `{"btpSapCrossplaneProviderConfigRefName":"","forProvider":[],"name":"","writeConnectionSecretToRef":[]}` | btpSapCrossplaneProviderConfigRefName defines crossplane provider configuration reference name (identifier) of a [BTP Global Account](https://help.sap.com/docs/btp/sap-business-technology-platform/getting-global-account)! |
| subaccountTrustConfigurations[0].forProvider | list | `[]` | [forProvider](https://doc.crds.dev/github.com/SAP/crossplane-provider-btp/security.btp.sap.crossplane.io/SubaccountTrustConfiguration/v1alpha1@v1.1.2) CRD |
| subaccountTrustConfigurations[0].name | string | - | Name of the SubaccountTrustConfiguration resource - [CRD Browser](https://doc.crds.dev/github.com/SAP/crossplane-provider-btp/security.btp.sap.crossplane.io/SubaccountTrustConfiguration/v1alpha1@v1.1.2?path=metadata). |
| subaccountTrustConfigurations[0].writeConnectionSecretToRef | list | `[]` | optional |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)