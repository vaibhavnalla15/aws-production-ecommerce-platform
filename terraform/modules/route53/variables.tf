############################################################
# Common Configuration
############################################################

variable "common_tags" {
  description = "Common resource tags"
  type        = map(string)
}

############################################################
# DNS Configuration
############################################################

variable "domain_name" {
  description = "Root domain name"
  type        = string
}