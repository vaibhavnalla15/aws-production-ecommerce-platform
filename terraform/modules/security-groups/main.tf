############################################################
# ALB Security Group
############################################################

# Security Group for the Application Load Balancer
resource "aws_security_group" "tf_alb_security_group" {
  name        = local.resource_names.alb_security_group
  description = "Security Group for the Application Load Balancer"
  vpc_id      = var.vpc_id

  tags = merge(
    var.common_tags,
    {
      Name = local.resource_names.alb_security_group
    }
  )
}

############################################################
# ALB Security Group Rules
############################################################

# Allow HTTP traffic from the Internet
resource "aws_vpc_security_group_ingress_rule" "tf_alb_http_ingress" {
  security_group_id = aws_security_group.tf_alb_security_group.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 80
  to_port     = 80
  ip_protocol = "tcp"

  description = "Allow HTTP traffic from the Internet"
}

# Allow HTTPS traffic from the Internet
resource "aws_vpc_security_group_ingress_rule" "tf_alb_https_ingress" {
  security_group_id = aws_security_group.tf_alb_security_group.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 443
  to_port     = 443
  ip_protocol = "tcp"

  description = "Allow HTTPS traffic from the Internet"
}

# Allow all outbound traffic
resource "aws_vpc_security_group_egress_rule" "tf_alb_all_egress" {
  security_group_id = aws_security_group.tf_alb_security_group.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"

  description = "Allow all outbound traffic"
}

############################################################
# EC2 Security Group
############################################################

# Security Group for EC2 instances
resource "aws_security_group" "tf_ec2_security_group" {
  name        = local.resource_names.ec2_security_group
  description = "Security Group for EC2 instances"
  vpc_id      = var.vpc_id

  tags = merge(
    var.common_tags,
    {
      Name = local.resource_names.ec2_security_group
    }
  )
}

############################################################
# EC2 Security Group Rules
############################################################

# Allow HTTP traffic only from the ALB Security Group
resource "aws_vpc_security_group_ingress_rule" "tf_ec2_http_ingress" {
  security_group_id            = aws_security_group.tf_ec2_security_group.id
  referenced_security_group_id = aws_security_group.tf_alb_security_group.id

  from_port   = 80
  to_port     = 80
  ip_protocol = "tcp"

  description = "Allow HTTP traffic from the ALB"
}

# Allow all outbound traffic
resource "aws_vpc_security_group_egress_rule" "tf_ec2_all_egress" {
  security_group_id = aws_security_group.tf_ec2_security_group.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"

  description = "Allow all outbound traffic"
}

############################################################
# RDS Security Group
############################################################

# Security Group for the PostgreSQL database
resource "aws_security_group" "tf_rds_security_group" {
  name        = local.resource_names.rds_security_group
  description = "Security Group for the PostgreSQL database"
  vpc_id      = var.vpc_id

  tags = merge(
    var.common_tags,
    {
      Name = local.resource_names.rds_security_group
    }
  )
}

############################################################
# RDS Security Group Rules
############################################################

# Allow PostgreSQL traffic only from the EC2 Security Group
resource "aws_vpc_security_group_ingress_rule" "tf_rds_postgres_ingress" {
  security_group_id            = aws_security_group.tf_rds_security_group.id
  referenced_security_group_id = aws_security_group.tf_ec2_security_group.id

  from_port   = 5432
  to_port     = 5432
  ip_protocol = "tcp"

  description = "Allow PostgreSQL traffic from EC2"
}

# Allow all outbound traffic
resource "aws_vpc_security_group_egress_rule" "tf_rds_all_egress" {
  security_group_id = aws_security_group.tf_rds_security_group.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"

  description = "Allow all outbound traffic"
}