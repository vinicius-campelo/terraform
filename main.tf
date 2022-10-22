terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}


provider "digitalocean" {
  token = var.token
}


resource "digitalocean_droplet" "jenkins" {
  image    = var.image
  name     = var.droplet[2]
  region   = var.region
  size     = var.storage_sizes
  ssh_keys = [data.digitalocean_ssh_key.autanbr.id]
}


data "digitalocean_ssh_key" "autanbr" {
  name = var.ssh_key
}

resource "digitalocean_kubernetes_cluster" "k8s" {
  name    = var.droplet[0]
  region  = var.region
  version = "1.24.4-do.0"

  node_pool {
    name       = "default"
    size       = var.storage_sizes
    node_count = 2
  }
}

