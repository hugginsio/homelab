package main

import rego.v1

# Resources with a namespace should be named for their parent.
# Unless:
#   - They are part of the bootstrap process
deny contains msg if {
	full_path := array.reverse(split(data.conftest.file.dir, "/"))
	"boostrap" in full_path

	# paths contains the two closest parent directories to the resource.
	paths := array.slice(full_path, 0, 3)
	not input.metadata.namespace in paths
	msg := sprintf("namespace %s not found in tree %s", [input.metadata.namespace, paths])
}
