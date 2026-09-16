

# crossplane-provider-aws-iam

![Version: 0.0.16](https://img.shields.io/badge/Version-0.0.16-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.11.0](https://img.shields.io/badge/AppVersion-1.11.0-informational?style=flat-square)

A Helm Chart to template AWS IAM manifests for its crossplane provider.

## Source Code

* <https://github.com/crossplane-contrib/provider-upjet-aws>
* <https://marketplace.upbound.io/providers/upbound/provider-aws-iam/latest>
* <https://marketplace.upbound.io/providers/upbound/provider-aws-iam/latest/resources/iam.aws.upbound.io/AccessKey/v1beta1>
* <https://marketplace.upbound.io/providers/upbound/provider-aws-iam/latest/resources/iam.aws.upbound.io/Policy/v1beta1>
* <https://marketplace.upbound.io/providers/upbound/provider-aws-iam/latest/resources/iam.aws.upbound.io/Role/v1beta1>
* <https://marketplace.upbound.io/providers/upbound/provider-aws-iam/latest/resources/iam.aws.upbound.io/RolePolicyAttachment/v1beta1>
* <https://marketplace.upbound.io/providers/upbound/provider-aws-iam/latest/resources/iam.aws.upbound.io/User/v1beta1>
* <https://marketplace.upbound.io/providers/upbound/provider-aws-iam/latest/resources/iam.aws.upbound.io/UserPolicyAttachment/v1beta1>
* <https://marketplace.upbound.io/providers/upbound/provider-aws-iam/latest/resources/iam.aws.upbound.io/Group/v1beta1>
* <https://marketplace.upbound.io/providers/upbound/provider-aws-iam/latest/resources/iam.aws.upbound.io/GroupMembership/v1beta1>
* <https://marketplace.upbound.io/providers/upbound/provider-aws-iam/latest/resources/iam.aws.upbound.io/GroupPolicyAttachment/v1beta1>
* <https://marketplace.upbound.io/providers/upbound/provider-aws-iam/latest/resources/iam.aws.upbound.io/InstanceProfile/v1beta1>
* <https://marketplace.upbound.io/providers/upbound/provider-aws-iam/latest/resources/iam.aws.upbound.io/RolePolicy/v1beta1>
* <https://marketplace.upbound.io/providers/upbound/provider-aws-iam/latest/resources/iam.aws.upbound.io/OpenIDConnectProvider/v1beta1>
* <https://marketplace.upbound.io/providers/upbound/provider-aws-iam/latest/resources/iam.aws.upbound.io/SAMLProvider/v1beta1>
* <https://marketplace.upbound.io/providers/upbound/provider-aws-iam/latest/resources/iam.aws.upbound.io/ServiceLinkedRole/v1beta1>
* <https://marketplace.upbound.io/providers/upbound/provider-aws-iam/latest/resources/iam.aws.upbound.io/UserGroupMembership/v1beta1>
* <https://marketplace.upbound.io/providers/upbound/provider-aws-iam/latest/resources/iam.aws.upbound.io/AccountPasswordPolicy/v1beta1>
* <https://marketplace.upbound.io/providers/upbound/provider-aws-iam/latest/resources/iam.aws.upbound.io/AccountAlias/v1beta1>
* <https://marketplace.upbound.io/providers/upbound/provider-aws-iam/latest/resources/iam.aws.upbound.io/UserLoginProfile/v1beta1>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| accessKeys | list | {} | Official documentation: [Kind: AccessKey](https://marketplace.upbound.io/providers/upbound/provider-aws-iam/latest/resources/iam.aws.upbound.io/AccessKey/v1beta1) |
| accountAliases | list | {} | Official documentation: [Kind: AccountAlias](https://marketplace.upbound.io/providers/upbound/provider-aws-iam/latest/resources/iam.aws.upbound.io/AccountAlias/v1beta1) |
| accountPasswordPolicies | list | {} | Official documentation: [Kind: AccountPasswordPolicy](https://marketplace.upbound.io/providers/upbound/provider-aws-iam/latest/resources/iam.aws.upbound.io/AccountPasswordPolicy/v1beta1) |
| defaults.accessKeys.deletionPolicy | string | `""` |  |
| defaults.accountAliases.deletionPolicy | string | `""` |  |
| defaults.accountPasswordPolicies.deletionPolicy | string | `""` |  |
| defaults.groupMemberships.deletionPolicy | string | `""` |  |
| defaults.groupPolicyAttachments.deletionPolicy | string | `""` |  |
| defaults.groups.deletionPolicy | string | `""` |  |
| defaults.instanceProfiles.deletionPolicy | string | `""` |  |
| defaults.openIDConnectProviders.deletionPolicy | string | `""` |  |
| defaults.policies.deletionPolicy | string | `""` |  |
| defaults.rolePolicies.deletionPolicy | string | `""` |  |
| defaults.rolePolicyAttachments.deletionPolicy | string | `""` |  |
| defaults.roles.deletionPolicy | string | `""` |  |
| defaults.samlProviders.deletionPolicy | string | `""` |  |
| defaults.serviceLinkedRoles.deletionPolicy | string | `""` |  |
| defaults.userGroupMemberships.deletionPolicy | string | `""` |  |
| defaults.userLoginProfiles.deletionPolicy | string | `""` |  |
| defaults.userPolicyAttachments.deletionPolicy | string | `""` |  |
| defaults.users.deletionPolicy | string | `""` |  |
| groupMemberships | list | {} | Official documentation: [Kind: GroupMembership](https://marketplace.upbound.io/providers/upbound/provider-aws-iam/latest/resources/iam.aws.upbound.io/GroupMembership/v1beta1) |
| groupPolicyAttachments | list | {} | Official documentation: [Kind: GroupPolicyAttachment](https://marketplace.upbound.io/providers/upbound/provider-aws-iam/latest/resources/iam.aws.upbound.io/GroupPolicyAttachment/v1beta1) |
| groups | list | {} | Official documentation: [Kind: Group](https://marketplace.upbound.io/providers/upbound/provider-aws-iam/latest/resources/iam.aws.upbound.io/Group/v1beta1) |
| instanceProfiles | list | {} | Official documentation: [Kind: InstanceProfile](https://marketplace.upbound.io/providers/upbound/provider-aws-iam/latest/resources/iam.aws.upbound.io/InstanceProfile/v1beta1) |
| openIDConnectProviders | list | {} | Official documentation: [Kind: OpenIDConnectProvider](https://marketplace.upbound.io/providers/upbound/provider-aws-iam/latest/resources/iam.aws.upbound.io/OpenIDConnectProvider/v1beta1) |
| policies | list | {} | Official documentation: [Kind: Policy](https://marketplace.upbound.io/providers/upbound/provider-aws-iam/latest/resources/iam.aws.upbound.io/Policy/v1beta1) |
| rolePolicies | list | {} | Official documentation: [Kind: RolePolicy](https://marketplace.upbound.io/providers/upbound/provider-aws-iam/latest/resources/iam.aws.upbound.io/RolePolicy/v1beta1) |
| rolePolicyAttachments | list | {} | Official documentation: [Kind: RolePolicyAttachment](https://marketplace.upbound.io/providers/upbound/provider-aws-iam/latest/resources/iam.aws.upbound.io/RolePolicyAttachment/v1beta1) |
| roles | list | {} | Official documentation: [AWS IAM Provider](https://marketplace.upbound.io/providers/upbound/provider-aws-iam/latest) and [Kind: Role](https://marketplace.upbound.io/providers/upbound/provider-aws-iam/latest/resources/iam.aws.upbound.io/Role/v1beta1) |
| roles[0].spec.deletionPolicy | string | `""` | DeletionPolicy specifies what will happen to the underlying external when this managed resource is deleted. |
| roles[0].spec.providerConfigRef | list | `[]` | ProviderConfigReference specifies how the provider that will be used to create, observe, update, and delete this managed resource should be configured. |
| roles[0].spec.publishConnectionDetailsTo | list | `[]` | PublishConnectionDetailsTo specifies the connection secret config. |
| roles[0].spec.writeConnectionSecretToRef | list | `[]` | writeConnectionSecretToRef: optional secret reference. |
| samlProviders | list | {} | Official documentation: [Kind: SAMLProvider](https://marketplace.upbound.io/providers/upbound/provider-aws-iam/latest/resources/iam.aws.upbound.io/SAMLProvider/v1beta1) |
| serviceLinkedRoles | list | {} | Official documentation: [Kind: ServiceLinkedRole](https://marketplace.upbound.io/providers/upbound/provider-aws-iam/latest/resources/iam.aws.upbound.io/ServiceLinkedRole/v1beta1) |
| userGroupMemberships | list | {} | Official documentation: [Kind: UserGroupMembership](https://marketplace.upbound.io/providers/upbound/provider-aws-iam/latest/resources/iam.aws.upbound.io/UserGroupMembership/v1beta1) |
| userLoginProfiles | list | {} | Official documentation: [Kind: UserLoginProfile](https://marketplace.upbound.io/providers/upbound/provider-aws-iam/latest/resources/iam.aws.upbound.io/UserLoginProfile/v1beta1) |
| userPolicyAttachments | list | {} | Official documentation: [Kind: UserPolicyAttachment](https://marketplace.upbound.io/providers/upbound/provider-aws-iam/latest/resources/iam.aws.upbound.io/UserPolicyAttachment/v1beta1) |
| users | list | {} | Official documentation: [Kind: User](https://marketplace.upbound.io/providers/upbound/provider-aws-iam/latest/resources/iam.aws.upbound.io/User/v1beta1) |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)