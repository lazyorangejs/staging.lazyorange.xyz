region = "fra1"

dns_zone          = "do.staging.lazyorange.xyz"
cluster_name      = "lazyorange-staging-doks"
root_gitlab_group = "6638212"

gitlab_runner_ng = {
  enabled = true
  ng = {
    min_size = 1
    max_size = 2
  }
}