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

resource "google_compute_firewall" "allow-ssh-from-iap" {
  name          = "allow-ssh-from-iap"
  network       = google_compute_network.vpc_network.id
  direction     = "INGRESS"
  source_ranges = ["35.235.240.0/20"]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}

resource "google_compute_firewall" "allow-tailscale-egress" {
  name      = "allow-tailscale-egress"
  network   = google_compute_network.vpc_network.id
  direction = "EGRESS"

  allow {
    protocol = "tcp"
    ports = [
      "80",
      "443"
    ]
  }

  allow {
    protocol = "udp"
    ports    = ["3478"]
  }
}

resource "google_compute_firewall" "allow-tailscale-ingress" {
  name          = "allow-tailscale-ingress"
  network       = google_compute_network.vpc_network.id
  direction     = "INGRESS"
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "udp"
    ports    = ["41641"]
  }
}

resource "google_service_account" "kv2" {
  account_id   = "kv2-integration"
  display_name = "kv2-integration"
  description  = "Provide GCS and GSM access for kv2."
}

resource "google_project_iam_member" "secret_accessor" {
  project = var.google_project
  role    = "roles/secretmanager.secretAccessor"
  member  = "serviceAccount:${google_service_account.kv2.email}"
}

resource "google_project_iam_member" "object_user" {
  project = var.google_project
  role    = "roles/storage.objectUser"
  member  = "serviceAccount:${google_service_account.kv2.email}"
}

resource "google_compute_instance" "kv2" {
  name         = "kv2-host"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  service_account {
    email  = google_service_account.kv2.email
    scopes = ["cloud-platform"]
  }

  boot_disk {
    auto_delete = true

    initialize_params {
      image = "projects/cos-cloud/global/images/cos-117-18613-164-38"
      size  = 10
      type  = "pd-standard"
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
