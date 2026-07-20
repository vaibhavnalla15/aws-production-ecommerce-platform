############################################################
# IAM Outputs
############################################################

# EC2 IAM Role ARN
output "ec2_role_arn" {
  description = "ARN of the EC2 IAM Role"
  value       = aws_iam_role.tf_ec2_role.arn
}

# EC2 Instance Profile Name
output "ec2_instance_profile_name" {
  description = "Name of the EC2 Instance Profile"
  value       = aws_iam_instance_profile.tf_ec2_instance_profile.name
}