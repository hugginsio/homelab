# 🏠 Homelab

This monorepo contains notes and configuration for my homelab and related cloud
infrastructure. It allows me to provide useful applications & services while
gaining hands-on experience with enterprise best practices including GitOps,
infrastructure-as-code, fault tolerance, and platform security.

I use some of the following tools & technologies in support of these goals:

- GitOps via `FluxCD`, `Helm`, and `Kustomize`
- IaC via `Terraform`
- Integrated secrets management via `sops` (repository secrets) and the External Secrets Operator (for secrets sync)
- CI automation via `GitHub Actions`, `conftest`, `pre-commit`; supported by `FluxCD`
- Security & policy management (as code!) via `Kyverno` with network security via `Cilium`
- Resilient stateful workloads via `Longhorn` for distributed storage
- Magical bare-metal Kubernetes via `Talos` with full disk encryption and robust node security

## Thanks

- [Home Operations on Discord](https://discord.gg/home-operations)
- [@whazor/k8s-at-home-search](https://kubesearch.dev)
- [@onedr0p/home-ops](https://github.com/onedr0p/home-ops/)
- [@buroa/k8s-gitops](https://github.com/buroa/k8s-gitops/)
