############################################################
# Common Configuration
############################################################

variable "common_tags" {
  description = "Common resource tags"
  type        = map(string)
}

############################################################
# Domain Configuration
############################################################

variable "domain_name" {
  description = "Primary domain name"
  type        = string
}

variable "subject_alternative_names" {
  description = "Subject Alternative Names"
  type        = list(string)
  default     = []
}

variable "hosted_zone_id" {
  description = "Route 53 Hosted Zone ID"
  type        = string
}