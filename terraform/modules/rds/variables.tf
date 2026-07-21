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

variable "private_subnet_ids" {
  description = "Private subnet IDs"
  type        = list(string)
}

variable "rds_security_group_id" {
  description = "RDS Security Group ID"
  type        = string
}

############################################################
# Database Configuration
############################################################

variable "db_name" {
  description = "Initial database name"
  type        = string
}

variable "db_username" {
  description = "Database administrator username"
  type        = string
}

variable "db_password" {
  description = "Database administrator password"
  type        = string
  sensitive   = true
}