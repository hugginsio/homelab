package main

import rego.v1

# Source resources should be polled infrequently; webhooks handle change notification.
deny contains msg if {
	input.kind in {"GitRepository", "OCIRepository", "HelmRepository"}
	input.spec.interval != "99h"
	msg := sprintf("%s interval should be '99h', got '%s'", [input.kind, input.spec.interval])
}

# Kustomizations should reconcile at 3h as a drift-detection fallback.
deny contains msg if {
	is_flux_kustomization
	resource_kind == "kustomization"
	input.spec.interval != "3h"
	msg := sprintf("Kustomization interval should be '3h', got '%s'", [input.spec.interval])
}

# HelmReleases should reconcile at 3h as a drift-detection fallback.
deny contains msg if {
	input.kind == "HelmRelease"
	input.spec.interval != "3h"
	msg := sprintf("HelmRelease interval should be '3h', got '%s'", [input.spec.interval])
}
