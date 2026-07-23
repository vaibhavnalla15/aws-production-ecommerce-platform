#############################################
# CloudWatch Dashboard
#############################################

resource "aws_cloudwatch_dashboard" "this" {
  dashboard_name = local.dashboard_name

  dashboard_body = jsonencode({
    widgets = [

      #######################################
      # EC2 CPU Utilization
      #######################################

      {
        type   = "metric"
        x      = 0
        y      = 0
        width  = 12
        height = 6

        properties = {
          title   = "EC2 CPU Utilization"
          view    = "timeSeries"
          stacked = false
          region  = "us-east-1"

          metrics = [
            [
              "AWS/EC2",
              "CPUUtilization",
              "AutoScalingGroupName",
              local.autoscaling_group_name
            ]
          ]

          stat   = "Average"
          period = 300
        }
      },

      #######################################
      # ALB Request Count
      #######################################

      {
        type   = "metric"
        x      = 12
        y      = 0
        width  = 12
        height = 6

        properties = {
          title   = "Application Load Balancer Request Count"
          view    = "timeSeries"
          stacked = false
          region  = "us-east-1"

          metrics = [
            [
              "AWS/ApplicationELB",
              "RequestCount",
              "LoadBalancer",
              local.alb_arn_suffix
            ]
          ]

          stat   = "Sum"
          period = 300
        }
      },

      #######################################
      # ALB Target Response Time
      #######################################

      {
        type   = "metric"
        x      = 0
        y      = 6
        width  = 12
        height = 6

        properties = {
          title   = "ALB Target Response Time"
          view    = "timeSeries"
          stacked = false
          region  = "us-east-1"

          metrics = [
            [
              "AWS/ApplicationELB",
              "TargetResponseTime",
              "LoadBalancer",
              local.alb_arn_suffix
            ]
          ]

          stat   = "Average"
          period = 300
        }
      },

      #######################################
      # ALB HTTP 5XX Errors
      #######################################

      {
        type   = "metric"
        x      = 12
        y      = 6
        width  = 12
        height = 6

        properties = {
          title   = "ALB HTTP 5XX Errors"
          view    = "timeSeries"
          stacked = false
          region  = "us-east-1"

          metrics = [
            [
              "AWS/ApplicationELB",
              "HTTPCode_ELB_5XX_Count",
              "LoadBalancer",
              local.alb_arn_suffix
            ]
          ]

          stat   = "Sum"
          period = 300
        }
      }
    ]
  })
}

#############################################
# EC2 CPU Utilization Alarm
#############################################

resource "aws_cloudwatch_metric_alarm" "ec2_cpu_high" {
  alarm_name          = "tf-cloudcart-ec2-high-cpu"
  alarm_description   = "Triggers when EC2 CPU utilization exceeds 80%."
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = 80

  dimensions = {
    AutoScalingGroupName = local.autoscaling_group_name
  }

  alarm_actions = [
    local.sns_topic_arn
  ]
}

#############################################
# ALB HTTP 5XX Alarm
#############################################

resource "aws_cloudwatch_metric_alarm" "alb_http_5xx" {
  alarm_name          = "tf-cloudcart-alb-http-5xx"
  alarm_description   = "Triggers when ALB returns HTTP 5XX responses."
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "HTTPCode_ELB_5XX_Count"
  namespace           = "AWS/ApplicationELB"
  period              = 300
  statistic           = "Sum"
  threshold           = 5

  dimensions = {
    LoadBalancer = local.alb_arn_suffix
  }

  alarm_actions = [
    local.sns_topic_arn
  ]
}