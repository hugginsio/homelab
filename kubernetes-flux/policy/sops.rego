package main

import rego.v1

# Files ending with 'sops.yaml' should be encrypted with SOPs.
deny contains msg if {
	input.kind == "Secret"
	endswith(data.conftest.file.name, "sops.yaml")
	not input.sops
	msg := "SOPs encryption is required for this file"
}
