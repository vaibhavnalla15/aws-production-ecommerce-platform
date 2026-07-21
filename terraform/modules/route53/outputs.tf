############################################################
# Route 53 Outputs
############################################################

output "hosted_zone_id" {
  description = "Route 53 Hosted Zone ID"
  value       = aws_route53_zone.tf_hosted_zone.zone_id
}

output "hosted_zone_name_servers" {
  description = "Route 53 Hosted Zone Name Servers"
  value       = aws_route53_zone.tf_hosted_zone.name_servers
}