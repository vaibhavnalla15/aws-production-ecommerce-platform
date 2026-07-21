############################################################
# Auto Scaling Group
############################################################

resource "aws_autoscaling_group" "tf_autoscaling_group" {
  name = local.resource_names.autoscaling_group

  min_size         = 2
  max_size         = 4
  desired_capacity = 2

  vpc_zone_identifier = var.private_subnet_ids

  target_group_arns = [
    var.target_group_arn
  ]

  health_check_type         = "ELB"
  health_check_grace_period = 300

  launch_template {
    id      = var.launch_template_id
    version = var.launch_template_latest_version
  }

  tag {
    key                 = "Name"
    value               = var.resource_names.ec2
    propagate_at_launch = true
  }

  dynamic "tag" {
    for_each = var.common_tags

    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}