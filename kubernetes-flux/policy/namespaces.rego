package main

import rego.v1

# Flux Kustomizations must live in flux-system.
deny contains msg if {
	is_flux_kustomization
	input.metadata.namespace != "flux-system"
	msg := sprintf("Flux Kustomization namespace should be 'flux-system', got '%s'", [input.metadata.namespace])
}

# All other resources should have a namespace matching a parent directory.
# Unless:
#   - They are part of the bootstrap process
#   - They are a Flux Kustomization (handled above)
deny contains msg if {
	not is_flux_kustomization
	full_path := array.reverse(split(data.conftest.file.dir, "/"))
	not "bootstrap" in full_path
	paths := array.slice(full_path, 0, 7)
	not input.metadata.namespace in paths
	msg := sprintf("namespace %s not found in tree %s", [input.metadata.namespace, paths])
}
