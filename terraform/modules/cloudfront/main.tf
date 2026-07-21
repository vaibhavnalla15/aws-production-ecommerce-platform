############################################################
# CloudFront Managed Policies
############################################################

data "aws_cloudfront_cache_policy" "caching_disabled" {
  name = "Managed-CachingDisabled"
}

data "aws_cloudfront_origin_request_policy" "all_viewer" {
  name = "Managed-AllViewer"
}

############################################################
# CloudFront Distribution
############################################################

resource "aws_cloudfront_distribution" "tf_cloudfront_distribution" {

  enabled         = true
  is_ipv6_enabled = true

  comment = local.resource_names.distribution

  aliases = [
    var.application_domain
  ]

  ############################################################
  # ALB Origin
  ############################################################

  origin {
    domain_name = var.alb_dns_name
    origin_id   = "alb-origin"

    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "https-only"
      origin_ssl_protocols   = ["TLSv1.2"]
    }
  }

  ############################################################
  # Viewer Certificate
  ############################################################

  viewer_certificate {
    acm_certificate_arn      = var.certificate_arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.2_2021"
  }

  ############################################################
  # Distribution Configuration
  ############################################################

  default_root_object = ""

  price_class = "PriceClass_100"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  ############################################################
  # Default Cache Behavior
  ############################################################

  default_cache_behavior {
    allowed_methods = [
      "GET",
      "HEAD",
      "OPTIONS",
      "PUT",
      "POST",
      "PATCH",
      "DELETE"
    ]

    cached_methods = [
      "GET",
      "HEAD"
    ]

    target_origin_id       = "alb-origin"
    viewer_protocol_policy = "redirect-to-https"
    compress               = true

    cache_policy_id          = data.aws_cloudfront_cache_policy.caching_disabled.id
    origin_request_policy_id = data.aws_cloudfront_origin_request_policy.all_viewer.id
  }

  tags = merge(
    var.common_tags,
    {
      Name = local.resource_names.distribution
    }
  )
}