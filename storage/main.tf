terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.54.0"
    }
  }
}

provider "google" {
  credentials = file(var.credentials_file)

  project = var.project_id
  region  = var.region
}

resource "google_storage_bucket" "k8s-backup" {
    name = "velero-akshit"
    force_destroy = false
    location = "ASIA-EAST1"

    storage_class = "STANDARD"
}