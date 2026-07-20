############################################################
# EC2 IAM Role
############################################################

# Trust policy allowing EC2 to assume this role
data "aws_iam_policy_document" "tf_ec2_assume_role_policy" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

# IAM Role for EC2 instances
resource "aws_iam_role" "tf_ec2_role" {
  name               = local.resource_names.ec2_role
  assume_role_policy = data.aws_iam_policy_document.tf_ec2_assume_role_policy.json

  tags = merge(
    var.common_tags,
    {
      Name = local.resource_names.ec2_role
    }
  )
}

############################################################
# IAM Policy
############################################################

# Permissions required by the EC2 instance
data "aws_iam_policy_document" "tf_ec2_policy_document" {
  statement {
    effect = "Allow"

    actions = [
      "ssm:GetParameter",
      "ssm:GetParameters",
      "ssm:GetParametersByPath"
    ]

    resources = ["*"]
  }
}

# IAM Policy for EC2
resource "aws_iam_policy" "tf_ec2_policy" {
  name        = local.resource_names.ec2_policy
  description = "IAM policy for EC2 instances"
  policy      = data.aws_iam_policy_document.tf_ec2_policy_document.json

  tags = merge(
    var.common_tags,
    {
      Name = local.resource_names.ec2_policy
    }
  )
}

############################################################
# Attach Policy to IAM Role
############################################################

resource "aws_iam_role_policy_attachment" "tf_ec2_policy_attachment" {
  role       = aws_iam_role.tf_ec2_role.name
  policy_arn = aws_iam_policy.tf_ec2_policy.arn
}

############################################################
# EC2 Instance Profile
############################################################

# Instance Profile for EC2 instances
resource "aws_iam_instance_profile" "tf_ec2_instance_profile" {
  name = local.resource_names.ec2_instance_profile
  role = aws_iam_role.tf_ec2_role.name

  tags = merge(
    var.common_tags,
    {
      Name = local.resource_names.ec2_instance_profile
    }
  )
}