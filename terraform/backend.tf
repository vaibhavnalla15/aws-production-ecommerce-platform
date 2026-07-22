############################################################
# Terraform Remote Backend
############################################################

terraform {
  backend "s3" {
    bucket       = "saul-cloudcart-tfstate"
    key          = "terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
  }
}