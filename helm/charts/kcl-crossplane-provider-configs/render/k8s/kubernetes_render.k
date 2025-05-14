import manifests

import schema

# Convert the `BTPSapCrossplaneIO` model into Kubernetes Manifest
kubernetesRender = lambda a: schema.BTPSapCrossplaneIO {
    # Construct the deployment manifest.
    btpsapcrossplaneio = {
        apiVersion = "btp.sap.crossplane.io/v1alpha1"
        kind = "ProviderConfig"
        metadata.name = a.name
        metadata.labels = a.labels
        metadata.namespace = "default"
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
    [btpsapcrossplaneio]
}

manifests.yaml_stream(sum([kubernetesRender(a) for a in schema.BTPSapCrossplaneIO.instances()], []))
