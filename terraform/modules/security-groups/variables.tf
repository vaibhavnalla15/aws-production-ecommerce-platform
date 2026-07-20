############################################################
# Variables
############################################################

# Common tags applied to all resources
variable "common_tags" {
  description = "Common tags applied to all resources"
  type        = map(string)
}

# Major resource names from the root module
variable "resource_names" {
  description = "Major resource names"
  type        = map(string)
}

# VPC ID where the security groups will be created
variable "vpc_id" {
  description = "VPC ID"
  type        = string
}