provider "aws" {
  region = var.aws_region

  default_tags {
    tags = local.common_tags
  }
}

############################################################
# AWS Provider (us-east-1 for ACM & CloudFront)
############################################################

provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"

  default_tags {
    tags = local.common_tags
  }
}