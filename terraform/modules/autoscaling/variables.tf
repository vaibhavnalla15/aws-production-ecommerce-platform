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
# Auto Scaling Configuration
############################################################

variable "private_subnet_ids" {
  description = "Private subnet IDs"
  type        = list(string)
}

variable "launch_template_id" {
  description = "Launch Template ID"
  type        = string
}

variable "launch_template_latest_version" {
  description = "Latest Launch Template version"
  type        = string
}

variable "target_group_arn" {
  description = "ALB Target Group ARN"
  type        = string
}