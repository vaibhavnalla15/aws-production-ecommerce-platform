############################################################
# Route 53 Hosted Zone
############################################################

resource "aws_route53_zone" "tf_hosted_zone" {
  name = var.domain_name

  tags = merge(
    var.common_tags,
    {
      Name = local.resource_names.hosted_zone
    }
  )
}