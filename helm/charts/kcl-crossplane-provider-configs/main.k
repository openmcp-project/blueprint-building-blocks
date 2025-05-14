import schema

config = schema.BTPSapCrossplaneIO {
    name = "provider-config-ref-name-btp-account-mcp-blueprints"
    labels = {
        "openmcp.cloud/blueprint-building-block" = "crossplane-provider-configs"
        "openmcp.cloud/blueprint-building-block-version" = "0.0.18"
    }
    cliServerUrl = "https://cli.btp.cloud.sap"
    globalAccount = "globalaccountsubdomain"
    cisCredentials = {
        secretRef = {
            key = "btp-cis-provider-credentials"
            name = "btp-account-mcp-blueprints"
            namespace = "default"
        }
        source = "Secret"
    }
    serviceAccountSecret = {
        secretRef = {
            key = "btp-service-account-provider-credentials"
            name = "btp-account-mcp-blueprints"
            namespace = "default"
        }
        source = "Secret"
    }
}
