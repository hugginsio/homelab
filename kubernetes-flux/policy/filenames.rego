package main

import rego.v1

# Resources of a kind should have a matching filename.
deny contains msg if {
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
