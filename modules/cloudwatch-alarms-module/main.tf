terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      configuration_aliases = [aws.frankfurt]
    }
}
}

resource "aws_cloudwatch_metric_alarm" "cpu_util" {
  alarm_name          = var.alarm_name
  comparison_operator = var.comparison_operator
  evaluation_periods  = var.evaluation_periods
  metric_name         = var.metric_name
  namespace           = var.namespace
  period              = var.period
  statistic           = var.statistic
  threshold           = var.threshold
  alarm_description   = var.alarm_description
  alarm_actions       = var.alarm_actions

  dimensions = {
    InstanceId = "${var.instance_id}"
  }
}

# resource "aws_cloudwatch_metric_alarm" "ec2_health_check" {
#   alarm_name          = var.alarm_name
#   comparison_operator = var.comparison_operator
#   evaluation_periods  = var.evaluation_periods
#   metric_name         = var.metric_name
#   namespace           = var.namespace
#   period              = var.period
#   statistic           = var.statistic
#   threshold           = var.threshold
#   alarm_description   = var.alarm_description
#   alarm_actions       = var.alarm_actions

#   dimensions = {
#     InstanceId = "${var.instance_id}"
#   }
# }