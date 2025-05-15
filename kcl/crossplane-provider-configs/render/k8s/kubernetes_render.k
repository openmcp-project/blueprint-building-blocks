import manifests

import schema

# Convert the `ProviderConfig` model into Kubernetes Manifest
kubernetesRender = lambda a: schema.ProviderConfig {
    # Construct the deployment manifest.
    providerconfig = {
        apiVersion = "btp.sap.crossplane.io/v1alpha1"
        kind = "ProviderConfig"
        metadata.name = a.name
        metadata.labels = a.labels
        metadata.namespace = a.namespace
        spec = {
            cliServerUrl = a.cliServerUrl
            globalAccount = a.globalAccount
            cisCredentials = {
                secretRef = {
                    key = a.cisCredentials.secretRef.key
                    name = a.cisCredentials.secretRef.name
                    namespace = a.cisCredentials.secretRef.namespace
                }
                source = a.cisCredentials.source
            }
            serviceAccountSecret = {
                secretRef = {
                    key = a.serviceAccountSecret.secretRef.key
                    name = a.serviceAccountSecret.secretRef.name
                    namespace = a.serviceAccountSecret.secretRef.namespace
                }
                source = a.serviceAccountSecret.source
            }
        }
    }
    # Returns Kubernetes manifests
    [providerconfig]
}

manifests.yaml_stream(sum([kubernetesRender(a) for a in schema.ProviderConfig.instances()], []))
