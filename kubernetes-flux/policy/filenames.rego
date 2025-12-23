package main

import rego.v1

# Resources of a kind should have a matching filename.
# Unless:
#   - The kind is Secret
#   - The kind is a Flux Kustomization
deny contains msg if {
	not startswith(input.apiVersion, "kustomize.toolkit.fluxcd.io")
	kind := lower(input.kind)
	not kind == "secret"
	not kind == lower(split(data.conftest.file.name, ".")[0])
	msg := sprintf("filename should be '%s'", [kind])
}

# Secrets should be named appropriately.
deny contains msg if {
	input.kind == "Secret"
	not endswith(data.conftest.file.name, "secret.sops.yaml")
	msg := "filename should end with 'secret.sops.yaml'"
}

# Flux Kustomizations should be named ks.yaml
deny contains msg if {
	startswith(input.apiVersion, "kustomize.toolkit.fluxcd.io")
	lower(input.kind) == "kustomization"
	not lower(split(data.conftest.file.name, ".")[0]) == "ks"
	msg := "filename should be `ks.yaml`"
}
