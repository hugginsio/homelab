terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.21.0"
    }
  }
}

provider "google" {
  project = var.google_project
  region  = "us-central1"
}

resource "google_compute_instance" "vm_instance" {
  name         = "cloudlab-gcp-alpha"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  boot_disk {
    auto_delete = true

    initialize_params {
      image = "projects/cos-cloud/global/images/cos-117-18613-164-38"
      size  = 10
      type  = "pd-balanced"
    }
  }

  network_interface {
    queue_count = 0
    stack_type  = "IPV4_ONLY"
    subnetwork  = google_compute_subnetwork.cloudlab-gcp-subnet-us-central1.id

    access_config {
      network_tier = "STANDARD"
    }
  }
}

resource "google_compute_network" "vpc_network" {
  name                    = "cloudlab-gcp"
  auto_create_subnetworks = false
  mtu                     = 1460
}

resource "google_compute_subnetwork" "cloudlab-gcp-subnet-us-central1" {
  name          = "cloudlab-gcp-subnet-us-central1"
  ip_cidr_range = "10.1.1.0/24"
  network       = google_compute_network.vpc_network.id
  region        = "us-central1"
}
