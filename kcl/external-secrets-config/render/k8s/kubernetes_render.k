import manifests
import schema

# Convert the `ExternalSecretsConfig` model into Kubernetes Manifest
kubernetesRender = lambda a: schema.ExternalSecretsConfig {
    externalSecret = [{
        apiVersion = "external-secrets.io/v1beta1"
        kind = "ExternalSecret"
        metadata.name = i.name
        metadata.namespace = i.namespace
        metadata.labels = i.labels
        spec = {
            refreshInterval = i.refreshInterval
            secretStoreRef = {
                name = i.secretStore.name
                kind = i.secretStore.kind
            }
            target = {
                name = i.target.name
            }
            data = i.data
        }
    } for i in a.externalSecret]

    secretStores = [{
        apiVersion = "external-secrets.io/v1beta1"
        kind = "SecretStore"
        metadata.name = i.name
        metadata.namespace = i.namespace
        metadata.labels = i.labels
        spec = {
            provider = i.provider
        }
    } for i in a.secretStores]
    # Returns Kubernetes manifests
    [if len(externalSecret)>0: *externalSecret, if len(secretStores)>0: *secretStores]
}

manifests.yaml_stream(sum([kubernetesRender(a) for a in schema.ExternalSecretsConfig.instances()], []))
