############################################################
# VPC
############################################################

# Create the main Virtual Private Cloud
resource "aws_vpc" "tf_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(
    var.common_tags,
    {
      Name = var.resource_names["vpc"]
    }
  )
}

############################################################
# Public Subnets
############################################################

# Public Subnet in Availability Zone 1a
resource "aws_subnet" "tf_public_subnet_1a" {
  vpc_id                  = aws_vpc.tf_vpc.id
  cidr_block              = var.public_subnet_cidrs[0]
  availability_zone       = var.availability_zones[0]
  map_public_ip_on_launch = true

  tags = merge(
    var.common_tags,
    {
      Name = local.resource_names.public_subnet_1a
    }
  )
}

# Public Subnet in Availability Zone 1b
resource "aws_subnet" "tf_public_subnet_1b" {
  vpc_id                  = aws_vpc.tf_vpc.id
  cidr_block              = var.public_subnet_cidrs[1]
  availability_zone       = var.availability_zones[1]
  map_public_ip_on_launch = true

  tags = merge(
    var.common_tags,
    {
      Name = local.resource_names.public_subnet_1b
    }
  )
}

############################################################
# Private Subnets
############################################################

# Private Subnet in Availability Zone 1a
resource "aws_subnet" "tf_private_subnet_1a" {
  vpc_id            = aws_vpc.tf_vpc.id
  cidr_block        = var.private_subnet_cidrs[0]
  availability_zone = var.availability_zones[0]

  tags = merge(
    var.common_tags,
    {
      Name = local.resource_names.private_subnet_1a
    }
  )
}

# Private Subnet in Availability Zone 1b
resource "aws_subnet" "tf_private_subnet_1b" {
  vpc_id            = aws_vpc.tf_vpc.id
  cidr_block        = var.private_subnet_cidrs[1]
  availability_zone = var.availability_zones[1]

  tags = merge(
    var.common_tags,
    {
      Name = local.resource_names.private_subnet_1b
    }
  )
}

############################################################
# Internet Gateway
############################################################

# Internet Gateway for public internet access
resource "aws_internet_gateway" "tf_igw" {
  vpc_id = aws_vpc.tf_vpc.id

  tags = merge(
    var.common_tags,
    {
      Name = local.resource_names.internet_gateway
    }
  )
}

############################################################
# Elastic IP
############################################################

# Elastic IP for the NAT Gateway
resource "aws_eip" "tf_nat_eip" {
  domain = "vpc"

  tags = merge(
    var.common_tags,
    {
      Name = local.resource_names.nat_elastic_ip
    }
  )

  depends_on = [
    aws_internet_gateway.tf_igw
  ]
}

############################################################
# NAT Gateway
############################################################

# NAT Gateway for outbound internet access from private subnets
resource "aws_nat_gateway" "tf_nat_gateway" {
  allocation_id = aws_eip.tf_nat_eip.id
  subnet_id     = aws_subnet.tf_public_subnet_1a.id

  tags = merge(
    var.common_tags,
    {
      Name = local.resource_names.nat_gateway
    }
  )

  depends_on = [
    aws_internet_gateway.tf_igw
  ]
}

############################################################
# Public Route Table
############################################################

# Route table for public subnets
resource "aws_route_table" "tf_public_route_table" {
  vpc_id = aws_vpc.tf_vpc.id

  # Route all outbound traffic to the Internet Gateway
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tf_igw.id
  }

  tags = merge(
    var.common_tags,
    {
      Name = local.resource_names.public_route_table
    }
  )
}

############################################################
# Public Route Table Associations
############################################################

# Associate Public Subnet 1a
resource "aws_route_table_association" "tf_public_subnet_1a_association" {
  subnet_id      = aws_subnet.tf_public_subnet_1a.id
  route_table_id = aws_route_table.tf_public_route_table.id
}

# Associate Public Subnet 1b
resource "aws_route_table_association" "tf_public_subnet_1b_association" {
  subnet_id      = aws_subnet.tf_public_subnet_1b.id
  route_table_id = aws_route_table.tf_public_route_table.id
}

############################################################
# Private Route Table
############################################################

# Route table for private subnets
resource "aws_route_table" "tf_private_route_table" {
  vpc_id = aws_vpc.tf_vpc.id

  # Route all outbound traffic through the NAT Gateway
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.tf_nat_gateway.id
  }

  tags = merge(
    var.common_tags,
    {
      Name = local.resource_names.private_route_table
    }
  )
}

############################################################
# Private Route Table Associations
############################################################

# Associate Private Subnet 1a
resource "aws_route_table_association" "tf_private_subnet_1a_association" {
  subnet_id      = aws_subnet.tf_private_subnet_1a.id
  route_table_id = aws_route_table.tf_private_route_table.id
}

# Associate Private Subnet 1b
resource "aws_route_table_association" "tf_private_subnet_1b_association" {
  subnet_id      = aws_subnet.tf_private_subnet_1b.id
  route_table_id = aws_route_table.tf_private_route_table.id
}