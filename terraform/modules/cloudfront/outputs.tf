############################################################
# CloudFront Outputs
############################################################

output "distribution_id" {
  description = "CloudFront Distribution ID"
  value       = aws_cloudfront_distribution.tf_cloudfront_distribution.id
}

output "distribution_domain_name" {
  description = "CloudFront Distribution Domain Name"
  value       = aws_cloudfront_distribution.tf_cloudfront_distribution.domain_name
}

output "distribution_hosted_zone_id" {
  description = "CloudFront Hosted Zone ID"
  value       = aws_cloudfront_distribution.tf_cloudfront_distribution.hosted_zone_id
}