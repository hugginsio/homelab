package main

import rego.v1

# The base filename without any extension components (e.g. "deployment" from "deployment.yaml").
file_base := lower(split(data.conftest.file.name, ".")[0])

# The lowercase kind of the current resource.
resource_kind := lower(input.kind)

# True when the resource belongs to the Flux Kustomization API group.
is_flux_kustomization if startswith(input.apiVersion, "kustomize.toolkit.fluxcd.io")

# True when the resource belongs to the Kind (cluster-API) API group.
is_kind_cluster if startswith(input.apiVersion, "kind.x-k8s.io")
