############################################################
# Local Values
############################################################

locals {

  # Security Group names
  resource_names = {
    alb_security_group = "tf-alb-sg"
    ec2_security_group = "tf-ec2-sg"
    rds_security_group = "tf-rds-sg"
  }

}