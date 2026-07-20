############################################################
# VPC Outputs
############################################################

# VPC ID
output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.tf_vpc.id
}

############################################################
# Public Subnet Outputs
############################################################

# Public Subnet IDs
output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value = [
    aws_subnet.tf_public_subnet_1a.id,
    aws_subnet.tf_public_subnet_1b.id
  ]
}

############################################################
# Private Subnet Outputs
############################################################

# Private Subnet IDs
output "private_subnet_ids" {
  description = "IDs of the private subnets"
  value = [
    aws_subnet.tf_private_subnet_1a.id,
    aws_subnet.tf_private_subnet_1b.id
  ]
}