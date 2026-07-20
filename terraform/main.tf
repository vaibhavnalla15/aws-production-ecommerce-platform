############################################################
# VPC Module
############################################################

# Creates the networking foundation for the e-commerce platform
module "vpc" {
  source = "./modules/vpc"

  # Common configuration
  common_tags    = local.common_tags
  resource_names = local.resource_names

  # Resource configuration
  vpc_cidr             = var.vpc_cidr
  availability_zones   = var.availability_zones
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}