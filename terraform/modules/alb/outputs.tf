############################################################
# ALB Outputs
############################################################

output "alb_arn" {
  description = "Application Load Balancer ARN"
  value       = aws_lb.tf_alb.arn
}

output "alb_dns_name" {
  description = "Application Load Balancer DNS name"
  value       = aws_lb.tf_alb.dns_name
}

output "target_group_arn" {
  description = "Target Group ARN"
  value       = aws_lb_target_group.tf_target_group.arn
}

############################################################
# CloudWatch Outputs
############################################################

output "alb_arn_suffix" {
  description = "Application Load Balancer ARN suffix"
  value       = aws_lb.tf_alb.arn_suffix
}

output "target_group_arn_suffix" {
  description = "Target Group ARN suffix"
  value       = aws_lb_target_group.tf_target_group.arn_suffix
}