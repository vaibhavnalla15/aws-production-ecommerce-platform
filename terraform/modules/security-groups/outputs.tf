############################################################
# Security Group Outputs
############################################################

# ALB Security Group ID
output "alb_security_group_id" {
  description = "ID of the ALB Security Group"
  value       = aws_security_group.tf_alb_security_group.id
}

# EC2 Security Group ID
output "ec2_security_group_id" {
  description = "ID of the EC2 Security Group"
  value       = aws_security_group.tf_ec2_security_group.id
}

# RDS Security Group ID
output "rds_security_group_id" {
  description = "ID of the RDS Security Group"
  value       = aws_security_group.tf_rds_security_group.id
}