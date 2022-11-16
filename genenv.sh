#!/usr/bin/env bash
echo "USERNAME=$(whoami)"
echo "DOCKER_HOST=$(hostname)"
echo "DOMAIN_NAME=$(tailscale status --json | jq -r '.Self.DNSName' | sed 's/.$//')"
