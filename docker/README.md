# docker

Compose files (and associated configuration) for Docker Standalone deployments.

## Structure

- `multi` (Containers ran on multiple nodes, e.g. Adguard Home)
- `single` (Containers ran on a single node, e.g. Paperless NGX)

## Environment

These containers are deployed on one of two 11th gen Intel mini-PCs: one with Ubuntu Server and one with multiple Debian LXCs on Proxmox. Currently, the majority of these workloads run on the primary Ubuntu Server node for easier access and management.

All the Docker containers are managed through Portainer, with the primary node running full Portainer EE and any active Debian LXCs running the Portainer Agent.

Users access Homelab resources through a custom domain mapped to the primary node by two instances of AdGuard Home. Reverse proxying is all handled by Traefik, while Homepage serves as a common dashboard for all resources. Container labels are used to configure Traefik and Homepage on demand. Users outside the network can tunnel in through a Wireguard VPN.

Inside the network, Uncomplicated Firewall and Tailscale are used to restrict traffic to all but a few ports on Docker hosts, such as HTTP(S) traffic and the Wireguard port.
