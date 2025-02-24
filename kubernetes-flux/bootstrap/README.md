# bootstrap

This directory contains the bootstrap configuration files for all clusters. Instead of using these files directly, you should use the Taskfile in the parent directory to bootstrap the clusters.

Additionally, the Kustomization that installs FluxCD is meant only for the bootstrap process. FluxCD will take over and synchronize with the shared cluster configuration after installation.
