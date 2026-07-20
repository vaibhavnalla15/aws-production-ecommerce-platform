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

############################################################
# Security Groups Module
############################################################

# Creates the security groups for the e-commerce platform
module "security_groups" {
  source = "./modules/security-groups"

  # Common configuration
  common_tags    = local.common_tags
  resource_names = local.resource_names

  # Resource configuration
  vpc_id = module.vpc.vpc_id
}

############################################################
# IAM Module
############################################################

# Creates IAM resources for EC2 instances
module "iam" {
  source = "./modules/iam"

  # Common configuration
  common_tags    = local.common_tags
  resource_names = local.resource_names
}