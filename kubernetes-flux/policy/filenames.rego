package main

import rego.v1

# Resources of a kind should have a matching filename.
# Unless:
#   - The kind is Secret
#   - The kind is Cluster (Kind)
#   - The kind is a Flux Kustomization
deny contains msg if {
	not is_flux_kustomization
	not is_kind_cluster
	not resource_kind == "secret"
	not resource_kind == file_base
	msg := sprintf("filename should be '%s'", [resource_kind])
}

# Secrets should be named appropriately.
deny contains msg if {
	input.kind == "Secret"
	not endswith(data.conftest.file.name, "secret.sops.yaml")
	msg := "filename should end with 'secret.sops.yaml'"
}

# Flux Kustomizations should be named ks.yaml.
deny contains msg if {
	is_flux_kustomization
	resource_kind == "kustomization"
	not file_base == "ks"
	msg := "filename should be `ks.yaml`"
}
