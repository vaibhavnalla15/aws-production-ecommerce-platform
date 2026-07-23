#############################################
# CloudWatch Dashboard
#############################################

output "dashboard_name" {
  description = "Name of the CloudWatch dashboard."
  value       = aws_cloudwatch_dashboard.this.dashboard_name
}

#############################################
# CloudWatch Alarms
#############################################

output "ec2_cpu_alarm_name" {
  description = "Name of the EC2 CPU utilization alarm."
  value       = aws_cloudwatch_metric_alarm.ec2_cpu_high.alarm_name
}

output "alb_http_5xx_alarm_name" {
  description = "Name of the ALB HTTP 5XX alarm."
  value       = aws_cloudwatch_metric_alarm.alb_http_5xx.alarm_name
}