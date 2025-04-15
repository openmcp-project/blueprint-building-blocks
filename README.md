[![REUSE status](https://api.reuse.software/badge/github.com/openmcp-project/blueprint-building-blocks)](https://api.reuse.software/info/github.com/openmcp-project/blueprint-building-blocks)

# blueprint-building-blocks

## About this project

This repositry contains [sub helm charts](https://helm.sh/docs/chart_template_guide/subcharts_and_globals/) of the [OpenMCP](https://github.com/openmcp-project) which are the building blocks for the OpenMCP Blueprints. To start your [Infrastructure as Data]() Cloud Journey with the OpenMCP Blueprint, visit this [repository](https://github.com/openmcp-project/blueprints) and follow `Getting Started` section.

## Requirements and Setup

### Helm Charts
[Helm Charts](http://helm.sh) located at [`./helm/charts`](./helm/charts) are build with various purpose in mind. Please consult `README.md` file of each Helm Chart to discover its purpose, `values.yaml` structure and intended puropse.

### Continous Delivery
All [Helm Charts](http://helm.sh) located in this repository will be [automatically versioned](https://github.com/openmcp-project/blueprint-workflows/tree/main/.github/actions/helm-chart/version-bump) and [pushed](.github/workflows/gh-pages-release.yml) into [Projects OCI registry](https://github.com/orgs/openmcp-project/packages?repo_name=blueprint-building-blocks) and Helm Repositry [cloud-orchestrator-mcp-blueprint-building-blocks](https://openmcp-project.github.io/blueprint-building-blocks).


### [Github Workflows](#github-workflows)
#### [`PR Status Checks`](#github-workflow-git-pr-status-checks)
More details see Github Workflow [`.github/workflows/git-pr-status-checks.yml`](https://github.com/openmcp-project/blueprint-workflows/tree/main/.github/workflows/git-pr-status-checks.yml) of [blueprint-workflows](https://github.com/openmcp-project/blueprint-workflows/tree/main/)

#### [`.ci.config.yaml`](#github-workflow-ci-config-yaml)

File `chart-abc/.ci.config.yaml` is optional for every Helm Chart and influences execution of [`.github/workflows/git-pr-status-checks.yml`](.github/workflows/git-pr-status-checks.yml).

You can enable or disable processing of certain Github Workflows for certain Helm Charts via [`.ci.config.yaml`](helm/charts/test-custom-chart/.ci.config.yaml)!

```yaml  
helm-chart-dependency-update: 
  enable: true # default is true, even if you do NOT declare this in .ci.config.yaml!
helm-chart-linting:
  enable: true # default is true, even if you do NOT declare this in .ci.config.yaml!
  options:
    --strict: true # fail on lint warnings (default true)
    --with-subcharts: false # lint dependent charts (default false)
helm-chart-validation:
  enable: true # default is true, even if you do NOT declare this in .ci.config.yaml!
  options:
    --skip-crds: false # if set true, no CRDs will be templated. By default, CRDs are templated (default false)
    --skip-tests: false # skip tests from templated output (default false)
    --include-crds: false # include CRDs in the templated output (default false)
    --debug: false # enable verbose output (default false)
    --dependency-update: true # update dependencies if they are missing before installing the chart (default true)
helm-docs:
  enable: true # default is true, even if you do NOT declare this in .ci.config.yaml!
  options:
    --badge-style: "flat-square" # badge style to use for charts (default "flat-square")
    --document-dependency-values: true # For charts with dependencies, include the dependency values in the chart values documentation
    --documentation-strict-mode: false # Fail the generation of docs if there are undocumented values
    --skip-version-footer: false # if true the helm-docs version footer will not be shown in the default README template
    --sort-values-order: "file" # order in which to sort the values table ("alphanum" or "file") (default "alphanum")
    --output-file: "README.md" #  markdown file path relative to each chart directory to which rendered documentation will be written (default "README.md")
helm-chart-version-bump:
  enable: true # default is true, even if you do NOT declare this in .ci.config.yaml!
k8s-manifest-templating:
  enable: true # default is true, even if you do NOT declare this in .ci.config.yaml!
  options:
    --skip-crds: false # if set true, no CRDs will be templated. By default, CRDs are templated (default false)
```

:bangbang: It is **HIGHLY** recommended **NOT** to `enabled: false`for `helm-chart-linting-manifest-validation.sh` :bangbang:

### [Deletion Dependency Graph](#helm-chart-dependencies-deletion-dependency-graph)
:bangbang: **DO NOT DELETE** / **DISABLE** your [Umbrella Helm Chart](https://github.com/openmcp-project/blueprints) Dependencies all at ONCE :bangbang:
If you want to clean-up / deprovision / delete SAP & Hyperscaler Resources, you need to follow a certain order!

We recommend to delete / disable the Helm Chart Dependencies in the following order: *read from right to left*
```
flux-config
└── crossplane-provider-pkgs
    └── external-secrets-config
        ├── crossplane-provider-configs
        └── crossplane-provider-apiextensions-composition
            ├── crossplane-gardener-shoot-clusters
            │   ├── crossplane-provider-helm
            │   └── crossplane-provider-kubernetes
            ├── crossplane-gardener-shoot-kubeconfigs
            │   ├── crossplane-provider-helm
            │   └── crossplane-provider-kubernetes
            ├── crossplane-provider-aws-*
            ├── crossplane-provider-btp-accounts
            └── crossplane-provider-dynatrace
```
E.g.: The `flux-config` dependency shall be deleted / disabled as last. 

#### Example
Lets have a look at the [`Chart.yaml`](https://github.com/openmcp-project/blueprints/blob/main/helm/umbrella/blueprints/provider-gardener.abc.shoot.live.k8s-hana.ondemand.com/Chart.yaml) of the template [`provider-gardener.abc.shoot.live.k8s-hana.ondemand.com`](https://github.com/openmcp-project/blueprints/blob/main/helm/umbrella/blueprints/provider-gardener.abc.shoot.live.k8s-hana.ondemand.com).

```yaml
dependencies:
  - name: crossplane-provider-configs
    alias: crossplane-provider-configs
    version: ....
    repository: "oci://ghcr.io/openmcp-project"
    tags:
      - crossplane-provider-configs
  - name: external-secrets-config
    alias: external-secrets-config
    version: ...
    repository: "oci://ghcr.io/openmcp-project"
    tags:
      - external-secrets-config
  - name: crossplane-gardener-shoot-clusters
    alias: crossplane-gardener-shoot-clusters
    version: ...
    repository: "oci://ghcr.io/openmcp-project"
    tags:
      - crossplane-gardener-shoot-clusters
  - name: crossplane-provider-helm
    alias: crossplane-provider-helm
    version: ...
    repository: "oci://ghcr.io/openmcp-project"
    tags:
      - crossplane-provider-helm
```

```yaml
# values.yaml
tags:
  external-secrets-config: true
  crossplane-provider-configs: true
  crossplane-gardener-shoot-clusters: true
  crossplane-provider-helm: true
```
According to the `Deletion Dependency Graph` section, the order of **deletion / disabling** the Helm Chart dependency is:
1. crossplane-provider-helm
2. crossplane-gardener-shoot-clusters
3. crossplane-provider-configs
4. external-secrets-config

**Why in this order**?
1. crossplane-provider-helm
> This Helm Chart is used to orchestrate the k8s stack on your Gardener / Kyma Cluster.
2. crossplane-gardener-shoot-clusters
> This Helm Chart is used to orchestrate Gardener Shoot Clusters.
3. crossplane-provider-configs
> This Helm Chart is used to create `crossplane` k8s manifests `kind: ProviderConfig` (e.g. `apiVersion: account.btp.sap.crossplane.io/v1alpha1`) for `crossplane providers` in order to orchestrate (cloud) service providers (e.g. BTP Accounts)
4. external-secrets-config
> This Helm Chart is used to establish a connection to SAP HashiCorp Vault in order to pull/push credentials of (cloud) service providers.

## Support, Feedback, Contributing

This project is open to feature requests/suggestions, bug reports etc. via [GitHub issues](https://github.com/openmcp-project/blueprint-building-blocks/issues). Contribution and feedback are encouraged and always welcome. For more information about how to contribute, the project structure, as well as additional contribution information, see our [Contribution Guidelines](CONTRIBUTING.md).

## Security / Disclosure
If you find any bug that may be a security problem, please follow our instructions at [in our security policy](https://github.com/openmcp-project/blueprint-building-blocks/security/policy) on how to report it. Please do not create GitHub issues for security-related doubts or problems.

## Code of Conduct

We as members, contributors, and leaders pledge to make participation in our community a harassment-free experience for everyone. By participating in this project, you agree to abide by its [Code of Conduct](https://github.com/SAP/.github/blob/main/CODE_OF_CONDUCT.md) at all times.

## Licensing

Copyright 2025 SAP SE or an SAP affiliate company and blueprint-building-blocks contributors. Please see our [LICENSE](LICENSE) for copyright and license information. Detailed information including third-party components and their licensing/copyright information is available [via the REUSE tool](https://api.reuse.software/info/github.com/openmcp-project/blueprint-building-blocks).
