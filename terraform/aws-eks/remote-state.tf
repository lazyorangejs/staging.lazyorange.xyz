# In this case was used the terraform-aws-tfstate-backend module by CloudPosse to create a AWS S3 backend.
# You can can create an s3 backend in other way.
#
# ```bash
# $ cd ./terraform/aws-eks
# $ cp remote-state.tf.example remote-state.tf
# $ terraform init
# $ terraform apply -var-file ./eu-central-1.tfvars -target=module.terraform_state_backend
# $ terraform output terraform_backend_config >> remote-state.tf
# $ terraform init
#```
#
# References:
# - https://github.com/cloudposse/terraform-aws-tfstate-backend
# - https://github.com/cloudposse/terraform-aws-tfstate-backend#usage
# - https://github.com/cloudposse/terraform-aws-tfstate-backend/releases

// module "terraform_state_backend" {
//   source     = "git::https://github.com/cloudposse/terraform-aws-tfstate-backend.git?ref=0.9.0"
//   namespace  = var.namespace
//   stage      = var.stage
//   region     = var.region
//   name       = "terraform"
//   attributes = ["state", "gitlab"]
// }

// output "terraform_backend_config" {
//   value = module.terraform_state_backend.terraform_backend_config
// }

locals {
  access_key = ""
}

terraform {
  required_version = ">= 0.12.2"

  backend "s3" {
    region         = "eu-central-1"
    bucket         = "lazyorange-staging-terraform-state-gitlab"
    key            = "terraform.tfstate"
    dynamodb_table = "lazyorange-staging-terraform-state-gitlab-lock"
    profile        = ""
    role_arn       = ""
    encrypt        = "true"
  }
}

