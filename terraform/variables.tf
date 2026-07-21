variable "aws_region" {
  description = "AWS region for all resources"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name used for resource naming"
  type        = string
  default     = "cloudcart"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "production"
}

############################################################
# Networking Variables
############################################################

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "availability_zones" {
  description = "Availability Zones"
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "Public subnet CIDR blocks"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "Private subnet CIDR blocks"
  type        = list(string)
}

############################################################
# Launch Template Variables
############################################################
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

############################################################
# Database Configuration
############################################################

variable "db_name" {
  description = "Database name"
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

############################################################
# Domain Configuration
############################################################

variable "domain_name" {
  description = "Root domain name"
  type        = string
}

############################################################
# Application Domain Configuration
############################################################

variable "root_domain_name" {
  description = "Root domain name"
  type        = string
}

variable "subdomain" {
  description = "Application subdomain"
  type        = string
}