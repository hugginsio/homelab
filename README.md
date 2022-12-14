# homelab

This repository contains the "production-ready" Docker Compose files used in my homelab environment.

## Environment

These Docker containers are deployed on one (or both) of my two host machines:

- An 11th gen Intel mini-PC running Ubuntu Server (`primary-docker`)
- A Raspberry Pi 4b running DietPi (`nas-docker`)

## Management

The Docker environments of both machines are managed through Portainer, with the mini-PC running the full Portainer EE container and the RPi running the Portainer Agent.

## Access

Inside the network, two Pi-hole instances redirect a homelab-specific domain and all its subdomains to the primary Docker host, where reverse proxying is handled by Traefik. Outside the network, vanilla Wireguard is used to connect.

Tailscale and Uncomplicated Firewall are used on both machines to limit access to all but a few ports to the Tailnet.
