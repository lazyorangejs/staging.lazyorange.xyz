terraform {
  required_version = "~> 0.12.3"

  required_providers {
    digitalocean = "~> 1.11"
    gitlab       = "~> 2.4"
    kubernetes   = "~> 1.10"
  }
}