############################################################
# Common Configuration
############################################################

variable "common_tags" {
  description = "Common resource tags"
  type        = map(string)
}

variable "resource_names" {
  description = "Resource names"
  type        = map(string)
}

############################################################
# Networking
############################################################

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "public_subnet_ids" {
  description = "Public subnet IDs"
  type        = list(string)
}

variable "alb_security_group_id" {
  description = "ALB Security Group ID"
  type        = string
}