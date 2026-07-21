############################################################
# Auto Scaling Outputs
############################################################

output "autoscaling_group_name" {
  description = "Auto Scaling Group name"
  value       = aws_autoscaling_group.tf_autoscaling_group.name
}

output "autoscaling_group_arn" {
  description = "Auto Scaling Group ARN"
  value       = aws_autoscaling_group.tf_autoscaling_group.arn
}