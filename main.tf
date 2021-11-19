terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.87.0"
    }
  }
}

provider "google" {
  credentials = file("key_sample.json")
  project = "sample-328206"
  region  = "us-central1"
}

resource "google_compute_instance_group_manager" "appserver" {
  name = "appserver-igm"

  base_instance_name = "app"
  zone               = "us-central1-a"

  version {
    instance_template  = google_compute_instance_template.instance_template.id
  }

  target_size  = 1

}

resource "google_compute_instance_template" "instance_template" {
name = "instance-template"
labels = {
environment = "dev"
}
machine_type = "e2-medium"
can_ip_forward = false

disk {
source_image = "debian-cloud/debian-9"
auto_delete = true
boot = true
}

metadata_startup_script = file("script.sh")
network_interface {
network = "default"
access_config {
      // Ephemeral public IP
    }
}

}