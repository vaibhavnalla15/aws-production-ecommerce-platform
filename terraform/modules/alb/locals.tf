############################################################
# Local Values
############################################################

locals {

  resource_names = {
    alb           = "tf-alb-ecommerce"
    target_group  = "tf-alb-target-group"
    http_listener = "tf-http-listener"
  }

}