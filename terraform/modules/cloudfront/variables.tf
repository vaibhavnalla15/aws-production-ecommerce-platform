############################################################
# Common Configuration
############################################################

variable "common_tags" {
  description = "Common resource tags"
  type        = map(string)
}

############################################################
# CloudFront Configuration
############################################################

variable "application_domain" {
  description = "Application domain name"
  type        = string
}

variable "certificate_arn" {
  description = "ACM Certificate ARN"
  type        = string
}

variable "alb_dns_name" {
  description = "Application Load Balancer DNS name"
  type        = string
}

############################################################
# Domain Configuration
############################################################

variable "aliases" {
  description = "Alternate domain names for the CloudFront distribution"
  type        = list(string)
  default     = []
}