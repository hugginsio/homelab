# Kubernetes

## Initial Install & Bootstrap

### Talos

> [!IMPORTANT]
> `age` (and the private key) will need to be available so that SOPs can decrypt the cluster secrets.

- [ ] Boot the Talos installer
- [ ] Ensure disk targets are set correctly in configuration (`talosctl get disks`)
- [ ] Run `CLUSTER=<cluster> task config` from the `talos/` directory to generate the configuration files and show the `talosctl apply-config` commands
- [ ] Once the Talos configuration is applied, run `task bootstrap-cni` from the `kubernetes-argo/` directory to install the CNI. This will not install the CSR approver, so that error will persist through CNI initialization.

### Kubernetes

Commands listed below will be run from the `kubernetes-argo/` directory.

- [ ] Run `task install-defaults`. This will install the core shared components, including the CSR approver.
  - One of these components is `fleet`, which will install the remaining shared components. At this point, the cluster is joined with the Tailnet and has access to pull down shared secrets with ESO.
- [ ] Optionally, run `CLUSTER=<cluster> task sync-cluster` to synchronize the cluster state with one of the clusters defined in this repository.

## Updates & Upgrades

### Talos

TODO
