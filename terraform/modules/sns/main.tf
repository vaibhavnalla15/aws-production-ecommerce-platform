##################################################
# SNS Topic
# Central notification topic for CloudWatch alarms.
##################################################

resource "aws_sns_topic" "tf_monitoring_topic" {
  name = var.topic_name
}

##################################################
# SNS Email Subscription
# Sends monitoring alerts to the configured email.
##################################################

resource "aws_sns_topic_subscription" "tf_email_subscription" {
  topic_arn = aws_sns_topic.tf_monitoring_topic.arn
  protocol  = "email"
  endpoint  = var.email_endpoint
}