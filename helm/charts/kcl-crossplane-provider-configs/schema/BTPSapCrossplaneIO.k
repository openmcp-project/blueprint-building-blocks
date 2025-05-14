schema BTPSapCrossplaneIO:
    """The BTPSapCrossplaneIO model."""
    name: str
    labels: {str:str}
    cliServerUrl: str
    globalAccount: str
    cisCredentials: Secret
    serviceAccountSecret: Secret

schema Secret:
    """The secret reference."""
    secretRef: SecretRef
    source: str

schema SecretRef:
    """The secret reference."""
    key: str
    name: str
    namespace: str
