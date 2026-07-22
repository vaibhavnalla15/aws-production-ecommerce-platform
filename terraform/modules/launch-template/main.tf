############################################################
# Launch Template
############################################################

# Launch Template for Auto Scaling Group
resource "aws_launch_template" "tf_launch_template" {
  name = local.resource_names.launch_template

  image_id      = var.ami_id
  instance_type = var.instance_type

  vpc_security_group_ids = [
    var.ec2_security_group_id
  ]

  iam_instance_profile {
    name = var.ec2_instance_profile_name
  }

  user_data = base64encode(
    templatefile("${path.module}/../../scripts/user-data.sh", {
      docker_image     = var.docker_image
      docker_image_tag = var.docker_image_tag
      application_port = var.application_port
    })
  )

  tag_specifications {
    resource_type = "instance"

    tags = merge(
      var.common_tags,
      {
        Name = var.resource_names.ec2
      }
    )
  }

  tags = merge(
    var.common_tags,
    {
      Name = local.resource_names.launch_template
    }
  )
}