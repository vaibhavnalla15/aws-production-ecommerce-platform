############################################################
# Launch Template Outputs
############################################################

# Launch Template ID
output "launch_template_id" {
  description = "ID of the Launch Template"
  value       = aws_launch_template.tf_launch_template.id
}

# Latest Launch Template Version
output "launch_template_latest_version" {
  description = "Latest version of the Launch Template"
  value       = aws_launch_template.tf_launch_template.latest_version
}