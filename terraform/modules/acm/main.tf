############################################################
# Terraform Configuration
############################################################

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

############################################################
# ACM Certificate
############################################################

resource "aws_acm_certificate" "tf_cloudcart_certificate" {

  domain_name               = var.domain_name
  subject_alternative_names = var.subject_alternative_names

  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }

  tags = merge(
    var.common_tags,
    {
      Name = local.resource_names.certificate
    }
  )
}

############################################################
# ACM DNS Validation Records
############################################################

resource "aws_route53_record" "tf_certificate_validation" {
  for_each = {
    for dvo in aws_acm_certificate.tf_cloudcart_certificate.domain_validation_options :
    dvo.domain_name => {
      name   = dvo.resource_record_name
      type   = dvo.resource_record_type
      record = dvo.resource_record_value
    }
  }

  zone_id = var.hosted_zone_id

  name    = each.value.name
  type    = each.value.type
  ttl     = 60
  records = [each.value.record]

  allow_overwrite = true
}

############################################################
# ACM Certificate Validation
############################################################

resource "aws_acm_certificate_validation" "tf_certificate_validation" {

  certificate_arn = aws_acm_certificate.tf_cloudcart_certificate.arn

  validation_record_fqdns = [
    for record in aws_route53_record.tf_certificate_validation :
    record.fqdn
  ]
}