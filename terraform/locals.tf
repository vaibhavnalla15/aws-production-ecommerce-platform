############################################################
# Local Values
############################################################

locals {

  # Common resource tags
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }

  # Major resource names
  resource_names = {
    vpc             = "tf-vpc-ecommerce"
    alb             = "tf-alb-ecommerce"
    target_group    = "tf-target-group-ecommerce"
    launch_template = "tf-launch-template-ecommerce"
    autoscaling     = "tf-asg-ecommerce"
    ec2             = "tf-ec2-ecommerce"
    rds             = "tf-rds-postgres-ecommerce"
    cloudfront      = "tf-cloudfront-ecommerce"
    https_listener  = "tf-https-listener"
  }

  ############################################################
  # Domain Configuration
  ############################################################

  application_domain = "${var.subdomain}.${var.root_domain_name}"

}
