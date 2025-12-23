# Kubernetes

## Initial Install & Bootstrap

### Talos

> [!IMPORTANT]
> `age` (and the private key) will need to be available so that SOPs can decrypt the cluster secrets.

- [ ] Boot the Talos installer
- [ ] Ensure disk targets are set correctly in configuration (`talosctl get disks`)
- [ ] Run `CLUSTER=<cluster> task config` from the `talos/` directory to generate the configuration files and show the `talosctl apply-config` commands
- [ ] Once the Talos configuration is applied, run `CLUSTER=<cluster> TALOS_NODE=<ip4> task bootstrap` from the `talos/` directory to bootstrap `etcd`.
- [ ] Run `task bootstrap-cni` from the `kubernetes-flux/` directory to install the CNI. This will not install the CSR approver, so that error will persist through CNI initialization.
  - Make sure the machine you run this command from can reach the Kubernetes API server. Double check your DNS settings.

### Kubernetes

Commands listed below will be run from the `kubernetes-flux/` directory.

- [ ] Run `CLUSTER=<cluster> task install-defaults`. This will install the core shared components, including the CSR approver.
  - One of these components is FluxCD, which will install the remaining shared components. At this point, the cluster is joined with the Tailnet and has access to pull down shared secrets with ESO.
- [ ] Optionally, run `CLUSTER=<cluster> task link-cluster` to synchronize the cluster state with one of the clusters defined in this repository.

## Updates & Upgrades

### Talos

- Is Talos failing to start because of issues mounting a disk? Try unmounting the volume and wiping it with `talosctl wipe`.
- Ensure you use the current schematic ID when updating to preserve system extensions.

## Disaster Recovery

### Kubernetes

#### Longhorn-managed Storage

1. Scale workload to zero. Ensure that FluxCD or fancy Operators will not restart the workload.
2. Delete PVC. Validate that the associated PV and Longhorn Volumes are deleted.
3. In the Longhorn UI, restore the Volume from the backup.
4. Once the Volume is recreated, use the menu to recreate the PVC and PV. Ensure you use the correct storage class name (longhorn).
5. Once the PVC and PV are recreated and attached to the Volume, scale up the workload.
6. Your last and most vital step is to pray that it works.
