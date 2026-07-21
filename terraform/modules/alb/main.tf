############################################################
# Application Load Balancer
############################################################

resource "aws_lb" "tf_alb" {
  name               = local.resource_names.alb
  internal           = false
  load_balancer_type = "application"

  security_groups = [
    var.alb_security_group_id
  ]

  subnets = var.public_subnet_ids

  enable_deletion_protection = false

  tags = merge(
    var.common_tags,
    {
      Name = local.resource_names.alb
    }
  )
}

############################################################
# Target Group
############################################################

resource "aws_lb_target_group" "tf_target_group" {
  name        = local.resource_names.target_group
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"

  vpc_id = var.vpc_id

  health_check {
    enabled             = true
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    interval            = 30
    timeout             = 5
  }

  tags = merge(
    var.common_tags,
    {
      Name = local.resource_names.target_group
    }
  )
}

############################################################
# HTTP Listener
############################################################

resource "aws_lb_listener" "tf_http_listener" {
  load_balancer_arn = aws_lb.tf_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }

  tags = merge(
    var.common_tags,
    {
      Name = local.resource_names.http_listener
    }
  )
}

############################################################
# HTTPS Listener
############################################################

resource "aws_lb_listener" "tf_https_listener" {
  load_balancer_arn = aws_lb.tf_alb.arn

  port     = 443
  protocol = "HTTPS"

  ssl_policy      = "ELBSecurityPolicy-TLS13-1-2-2021-06"
  certificate_arn = var.certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tf_target_group.arn
  }

  tags = merge(
    var.common_tags,
    {
      Name = local.resource_names.https_listener
    }
  )
}