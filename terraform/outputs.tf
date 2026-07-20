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