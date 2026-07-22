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

# EC2 Instance Profile Name
variable "ec2_instance_profile_name" {
  description = "EC2 Instance Profile Name"
  type        = string
}

# EC2 Security Group ID
variable "ec2_security_group_id" {
  description = "EC2 Security Group ID"
  type        = string
}

############################################################
# EC2 Configuration
############################################################

# EC2 AMI ID
variable "ami_id" {
  description = "Amazon Machine Image ID"
  type        = string
}

# EC2 Instance Type
variable "instance_type" {
  description = "EC2 instance type"
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
}

############################################################
# Application Configuration
############################################################

variable "application_port" {
  description = "Port exposed by the CloudCart application container"
  type        = number
}