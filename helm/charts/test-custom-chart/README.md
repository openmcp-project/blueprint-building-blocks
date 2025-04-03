# test-custom-chart

![Version: 0.0.8](https://img.shields.io/badge/Version-0.0.8-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.16.0](https://img.shields.io/badge/AppVersion-1.16.0-informational?style=flat-square)

A Helm chart to test github action and workflows. NOTHING MORE!

**Homepage:** <https://github.com/openmcp-project/blueprint-building-blocks>

## Source Code

* <https://github.com/openmcp-project/blueprint-building-blocks>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../mcp/sap-btp-services | sap-btp-services | ~0.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| fullnameOverride | string | `""` | full name override |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"nginx"` |  |
| image.tag | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| livenessProbe.httpGet.path | string | `"/"` |  |
| livenessProbe.httpGet.port | string | `"http"` |  |
| nameOverride | string | `""` | name override |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| readinessProbe.httpGet.path | string | `"/"` |  |
| readinessProbe.httpGet.port | string | `"http"` |  |
| replicaCount | int | `1` | replication count |
| resources | object | `{}` |  |
| sap-btp-services.services[0].bindings[0].credentialsRotationPolicy.enabled | bool | `true` |  |
| sap-btp-services.services[0].bindings[0].credentialsRotationPolicy.rotatedBindingTTL | string | `"2h"` |  |
| sap-btp-services.services[0].bindings[0].credentialsRotationPolicy.rotationFrequency | string | `"480h"` |  |
| sap-btp-services.services[0].bindings[0].name | string | `"ketos-op-cluster-ias"` |  |
| sap-btp-services.services[0].bindings[0].parameters.credential-type | string | `"SECRET"` |  |
| sap-btp-services.services[0].bindings[0].secretName | string | `"btp-ias"` |  |
| sap-btp-services.services[0].instance.name | string | `"ketos-op-cluster-ias"` |  |
| sap-btp-services.services[0].instance.parameters.consumed-apis | list | `[]` |  |
| sap-btp-services.services[0].instance.parameters.display-name | string | `""` |  |
| sap-btp-services.services[0].instance.parameters.multi-tenant | bool | `true` |  |
| sap-btp-services.services[0].instance.parameters.oauth2-configuration.redirect-uris[0] | string | `"https://*.../oauth2/callback"` |  |
| sap-btp-services.services[0].instance.parameters.oauth2-configuration.redirect-uris[1] | string | `"https://*.../callback"` |  |
| sap-btp-services.services[0].instance.parameters.oauth2-configuration.redirect-uris[2] | string | `"https://*.../*"` |  |
| sap-btp-services.services[0].instance.parameters.xsuaa-cross-consumption | bool | `true` |  |
| sap-btp-services.services[0].instance.serviceOfferingName | string | `"identity"` |  |
| sap-btp-services.services[0].instance.servicePlanName | string | `"application"` |  |
| sap-btp-services.services[0].name | string | `"identityApplication"` |  |
| sap-btp-services.services[0].namespace | string | `"default"` |  |
| securityContext | object | `{}` |  |
| service.port | int | `80` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.automount | bool | `true` | Automatically mount a ServiceAccount's API credentials? |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` |  |
| tolerations | list | `[]` |  |
| volumeMounts | list | `[]` |  |
| volumes | list | `[]` |  |

