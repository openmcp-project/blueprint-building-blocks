package kube

clusterExternalSecret: [ID=_]: {
    apiVersion: "external-secrets.io/v1beta1"
    kind:       "ClusterExternalSecret"
    metadata: {
        name: ID
        labels: {
            "openmcp.cloud/blueprint-building-block":         "external-secrets-config"
            "openmcp.cloud/blueprint-building-block-version": "0.1.10"
        }
    }
    spec: {
        externalSecretName: "externalSecretName"
        namespaceSelectors: [{
            cool:        "label"
            matchLabels: null
        }]
        refreshTime: "1m"
        externalSecretSpec: {
            data: [{
                remoteRef: {
                    key:      "provider-key"
                    property: "provider-key-property"
                    version:  "provider-key-version"
                }
                secretKey: "secret-key-to-be-managed"
            }]
            dataFrom: [{
                key:      "provider-key"
                property: "provider-key-property"
                version:  "provider-key-version"
            }]
            refreshInterval: "1h"
            secretStoreRef: {
                kind: "SecretStore"
                name: "secret-store-name"
            }
            target: {
                creationPolicy: "Merge"
                name:           "my-secret"
                template: {

                    metadata: {
                        annotations: {}
                        labels: {}
                    }
                    templateFrom: [{
                        configMap: {
                            items: [{
                                key: "alertmanager.yaml"
                            }]
                            name: "alertmanager"
                        }
                    }]
                    type: "kubernetes.io/dockerconfigjson"
                }
            }
        }
    }
} 

externalSecret: [ID=_]: {
	// Source: external-secrets-config/templates/external-secret.yaml
	apiVersion: "external-secrets.io/v1beta1"
	kind:       "ExternalSecret"
	metadata: {
		name:      ID 
		namespace: "default"
		labels: {
			"openmcp.cloud/blueprint-building-block":         "external-secrets-config"
			"openmcp.cloud/blueprint-building-block-version": "0.1.10"
		}
	}
	spec: {
		refreshInterval: "15m"
		target: name: ID
	}
}
