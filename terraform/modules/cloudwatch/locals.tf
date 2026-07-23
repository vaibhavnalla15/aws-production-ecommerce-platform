#############################################
# CloudWatch Dashboard
#############################################

locals {
  dashboard_name = var.dashboard_name

  ###########################################
  # EC2 Monitoring
  ###########################################

  autoscaling_group_name = var.autoscaling_group_name

  ###########################################
  # Application Load Balancer Monitoring
  ###########################################

  alb_arn_suffix          = var.alb_arn_suffix
  target_group_arn_suffix = var.target_group_arn_suffix

  ###########################################
  # SNS Notifications
  ###########################################

  sns_topic_arn = var.sns_topic_arn
}