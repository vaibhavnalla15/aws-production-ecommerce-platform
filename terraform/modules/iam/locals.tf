############################################################
# Local Values
############################################################

locals {

  # IAM resource names
  resource_names = {
    ec2_role             = "tf-ec2-role-ecommerce"
    ec2_instance_profile = "tf-ec2-instance-profile-ecommerce"
    ec2_policy           = "tf-ec2-policy-ecommerce"
  }

}