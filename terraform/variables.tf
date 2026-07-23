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

############################################################
# Docker Configuration
############################################################

variable "docker_image" {
  description = "Docker Hub image for CloudCart"
  type        = string
}

variable "docker_image_tag" {
  description = "Docker image tag"
  type        = string
  default     = "latest"
}

############################################################
# Application Configuration
############################################################

variable "application_port" {
  description = "Port exposed by the CloudCart application container"
  type        = number
  default     = 5000
}

##################################################
# SNS Configuration
##################################################

variable "sns_topic_name" {
  description = "Name of the SNS topic used for monitoring notifications."
  type        = string
}

variable "notification_email" {
  description = "Email address to receive CloudWatch alarm notifications."
  type        = string
}

#############################################
# CloudWatch
#############################################

variable "cloudwatch_dashboard_name" {
  description = "Name of the CloudWatch dashboard."
  type        = string
}
