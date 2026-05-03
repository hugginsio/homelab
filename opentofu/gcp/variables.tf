variable "google_project" {
  type = string
}

variable "kv2_cloud_storage" {
  type      = string
  sensitive = true
}

variable "kv2_private_key" {
  type      = string
  sensitive = true
}

variable "kv2_public_key" {
  type      = string
  sensitive = true
}

variable "kv2_ts_authkey" {
  type      = string
  sensitive = true
}
