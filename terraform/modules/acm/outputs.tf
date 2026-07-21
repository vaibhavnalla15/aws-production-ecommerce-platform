############################################################
# ACM Outputs
############################################################

output "certificate_arn" {
  description = "ACM Certificate ARN"
  value       = aws_acm_certificate_validation.tf_certificate_validation.certificate_arn
}