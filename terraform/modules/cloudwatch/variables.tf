#############################################
# CloudWatch Dashboard
#############################################

variable "dashboard_name" {
  description = "Name of the CloudWatch dashboard."
  type        = string
}

#############################################
# EC2 Monitoring
#############################################

variable "autoscaling_group_name" {
  description = "Name of the Auto Scaling Group to monitor."
  type        = string
}

#############################################
# Application Load Balancer Monitoring
#############################################

variable "alb_arn_suffix" {
  description = "ARN suffix of the Application Load Balancer."
  type        = string
}

variable "target_group_arn_suffix" {
  description = "ARN suffix of the Target Group."
  type        = string
}

#############################################
# SNS Notifications
#############################################

variable "sns_topic_arn" {
  description = "SNS Topic ARN used for CloudWatch alarm notifications."
  type        = string
}