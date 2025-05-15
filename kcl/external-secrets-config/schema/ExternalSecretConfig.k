schema ExternalSecretsConfig:
    defaults?: Defaults
    secretStores?: [SecretStore]
    externalSecret?: [ExternalSecret]
    clusterSecretStores?: [ClusterSecretStore]
    clusterExternalSecret?: [ClusterExternalSecret]
    pushSecrets?: [PushSecret]
    credentials?: [Credential]

schema Defaults:
    namespace: str = "default"
    externalSecret: ExternalSecretDefaults

schema ExternalSecretDefaults:
    secretStoreRef: SecretStoreRefDefaults

schema SecretStoreRefDefaults:
    kind: str = "SecretStore"

schema SecretStore:
    name: str
    namespace: str = "ns1"
    labels: {str:str}
    provider: {:}
#    provider: VaultProvider

schema VaultProvider:
    vault: Vault

schema Vault:
    server: str
    namespace: str = "ns1"
    path: str
    version: str = "v2"
    auth: VaultAuth

schema VaultAuth:
    appRole: AppRole

schema AppRole:
    path: str = "approle"
    roleId: str
    secretRef: SecretRef

schema SecretRef:
    name: str
    key: str

schema ExternalSecret:
    name: str
    namespace: str = "ns1"
    labels: {str:str}
    secretStore: SecretStoreRef
    refreshInterval: str
    target: ExternalSecretTarget
    data: []
    
schema ExternalSecretTarget:
    name: str
    template?: []
    creationPolicy?: str
    deletionPolicy?: str
    immutable?: bool = False

schema SecretStoreRef:
    name: str
    kind: str = "SecretStore"

schema RemoteRef:
    key: str
    property: str

schema ClusterSecretStore:
    name: str
    controller: str
    provider: VaultProvider

schema ClusterExternalSecret:
    name: str
    externalSecretName: str
    refreshTime: str
    namespaceSelectors: []
    externalSecretSpec: ExternalSecretSpec

schema ExternalSecretSpec:
    secretStoreRef: [SecretStoreRef]
    target: []
    refreshInterval: str
    data: []
    dataFrom: []

schema PushSecret:
    name: str
    namespace: str = "ns1"
    spec: PushSecretSpec

schema PushSecretSpec:
    updatePolicy: str
    deletionPolicy: str
    refreshInterval: str
    secretStoreRefs: []
    selector: []
    template: []
    data: []

schema Credential:
    name: str
    namespace: str = "ns1"
    stringData: []
    data: []
