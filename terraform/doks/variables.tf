variable "region" {
  type        = string
  description = "DigitalOcean Region"
}

variable "enabled" {
  type    = bool
  default = true
}

variable "cluster_name" {
  type = string
}

variable "dns_zone" {
  type        = string
  description = "specifies the DNS suffix for the externally-visible websites and services deployed in the cluster"
}

variable "root_gitlab_project" {
  type        = string
  description = "A project id that acts as a Gitlab Manage repo, will be used to setup a few environment variables to properly setup other CI jobs"
}

variable "root_gitlab_group" {
  type = string
}

variable "gitlab_runner_installed" {
  type    = bool
  default = false
}

variable "kubernetes_version" {
  type        = string
  default     = "1.15.9-do.0"
  description = "Desired Kubernetes master version. If you do not specify a value, the latest available version is used"
}

variable "gitlab_runner_ng" {
  type = object({
    ng = object({
      min_size = number,
      max_size = number,
    })
  })

  default = {
    ng = {
      min_size = 1,
      max_size = 2
    }
  }
}