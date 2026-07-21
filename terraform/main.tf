############################################################
# Amazon Linux 2023 AMI
############################################################

data "aws_ami" "amazon_linux_2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

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

############################################################
# Launch Template Module
############################################################

module "launch_template" {
  source = "./modules/launch-template"

  # Common configuration
  common_tags    = local.common_tags
  resource_names = local.resource_names

  # Infrastructure dependencies
  ec2_instance_profile_name = module.iam.ec2_instance_profile_name
  ec2_security_group_id     = module.security_groups.ec2_security_group_id

  # EC2 configuration
  ami_id        = data.aws_ami.amazon_linux_2023.id
  instance_type = var.instance_type
}

############################################################
# ALB Module
############################################################

module "alb" {
  source = "./modules/alb"

  # Common configuration
  common_tags    = local.common_tags
  resource_names = local.resource_names

  # Networking
  vpc_id                = module.vpc.vpc_id
  public_subnet_ids     = module.vpc.public_subnet_ids
  alb_security_group_id = module.security_groups.alb_security_group_id

  # HTTPS
  certificate_arn = module.acm.certificate_arn
}

############################################################
# Auto Scaling Module
############################################################

module "autoscaling" {
  source = "./modules/autoscaling"

  # Common configuration
  common_tags    = local.common_tags
  resource_names = local.resource_names

  # Networking
  private_subnet_ids = module.vpc.private_subnet_ids

  # Launch Template
  launch_template_id             = module.launch_template.launch_template_id
  launch_template_latest_version = module.launch_template.launch_template_latest_version

  # Load Balancer
  target_group_arn = module.alb.target_group_arn
}

############################################################
# RDS Module
############################################################

module "rds" {
  source = "./modules/rds"

  # Common configuration
  common_tags    = local.common_tags
  resource_names = local.resource_names

  # Networking
  private_subnet_ids    = module.vpc.private_subnet_ids
  rds_security_group_id = module.security_groups.rds_security_group_id

  # Database
  db_name     = var.db_name
  db_username = var.db_username
  db_password = var.db_password
}

############################################################
# Route 53 Module
############################################################

module "route53" {
  source = "./modules/route53"

  # Common configuration
  common_tags = local.common_tags

  # Domain configuration
  domain_name = var.domain_name
}

############################################################
# ACM Module
############################################################

module "acm" {
  source = "./modules/acm"

  providers = {
    aws = aws.us_east_1
  }

  # Common configuration
  common_tags = local.common_tags

  # Domain configuration
  domain_name = local.application_domain

  hosted_zone_id = module.route53.hosted_zone_id
}

############################################################
# CloudFront
############################################################

module "cloudfront" {
  source = "./modules/cloudfront"

  # Common configuration
  common_tags = local.common_tags

  # Origin
  alb_dns_name = module.alb.alb_dns_name

  # HTTPS
  certificate_arn = module.acm.certificate_arn

  # Domain
  application_domain = local.application_domain

  aliases = [
    local.application_domain
  ]
}

############################################################
# Route53 Alias Record
############################################################

resource "aws_route53_record" "cloudfront_alias" {
  zone_id = module.route53.hosted_zone_id
  name    = local.application_domain
  type    = "A"

  alias {
    name                   = module.cloudfront.distribution_domain_name
    zone_id                = module.cloudfront.distribution_hosted_zone_id
    evaluate_target_health = false
  }
}