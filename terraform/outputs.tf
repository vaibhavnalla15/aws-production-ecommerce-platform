############################################################
# VPC Outputs
############################################################

# VPC ID
output "vpc_id" {
  description = "ID of the VPC"
  value       = module.vpc.vpc_id
}

############################################################
# Public Subnet Outputs
############################################################

# Public Subnet IDs
output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = module.vpc.public_subnet_ids
}

############################################################
# Private Subnet Outputs
############################################################

# Private Subnet IDs
output "private_subnet_ids" {
  description = "IDs of the private subnets"
  value       = module.vpc.private_subnet_ids
}

############################################################
# Security Group Outputs
############################################################

# ALB Security Group ID
output "alb_security_group_id" {
  description = "ID of the ALB Security Group"
  value       = module.security_groups.alb_security_group_id
}

# EC2 Security Group ID
output "ec2_security_group_id" {
  description = "ID of the EC2 Security Group"
  value       = module.security_groups.ec2_security_group_id
}

# RDS Security Group ID
output "rds_security_group_id" {
  description = "ID of the RDS Security Group"
  value       = module.security_groups.rds_security_group_id
}

############################################################
# IAM Outputs
############################################################

# EC2 IAM Role ARN
output "ec2_role_arn" {
  description = "ARN of the EC2 IAM Role"
  value       = module.iam.ec2_role_arn
}

# EC2 Instance Profile Name
output "ec2_instance_profile_name" {
  description = "Name of the EC2 Instance Profile"
  value       = module.iam.ec2_instance_profile_name
}

############################################################
# Launch Template Outputs
############################################################

output "launch_template_id" {
  description = "Launch Template ID"
  value       = module.launch_template.launch_template_id
}

output "launch_template_latest_version" {
  description = "Latest Launch Template Version"
  value       = module.launch_template.launch_template_latest_version
}

############################################################
# ALB Outputs
############################################################

output "alb_dns_name" {
  description = "Application Load Balancer DNS Name"
  value       = module.alb.alb_dns_name
}

output "target_group_arn" {
  description = "Target Group ARN"
  value       = module.alb.target_group_arn
}

############################################################
# Auto Scaling Outputs
############################################################

output "autoscaling_group_name" {
  description = "Auto Scaling Group name"
  value       = module.autoscaling.autoscaling_group_name
}

output "autoscaling_group_arn" {
  description = "Auto Scaling Group ARN"
  value       = module.autoscaling.autoscaling_group_arn
}

############################################################
# RDS Outputs
############################################################

output "db_instance_endpoint" {
  description = "RDS endpoint"
  value       = module.rds.db_instance_endpoint
}

output "db_instance_port" {
  description = "RDS port"
  value       = module.rds.db_instance_port
}

output "db_instance_identifier" {
  description = "RDS instance identifier"
  value       = module.rds.db_instance_identifier
}

############################################################
# Route 53 Outputs
############################################################

output "hosted_zone_id" {
  description = "Route 53 Hosted Zone ID"
  value       = module.route53.hosted_zone_id
}

output "hosted_zone_name_servers" {
  description = "Route 53 Hosted Zone Name Servers"
  value       = module.route53.hosted_zone_name_servers
}

############################################################
# ACM Outputs
############################################################

output "certificate_arn" {
  description = "ACM Certificate ARN"
  value       = module.acm.certificate_arn
}