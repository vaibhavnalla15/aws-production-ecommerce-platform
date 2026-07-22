##################################################
# SNS Module Variables
##################################################

variable "topic_name" {
  description = "Name of the SNS topic used for monitoring notifications."
  type        = string
}

variable "email_endpoint" {
  description = "Email address that will receive CloudWatch alarm notifications."
  type        = string
}