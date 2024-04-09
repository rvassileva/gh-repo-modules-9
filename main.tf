terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  alias  = "london"
  region = "eu-west-2"
}

provider "aws" {
  alias  = "frankfurt"
  region = "eu-central-1"
}

resource "aws_instance" "web_server_dev" {
  provider      = aws.london
  ami           = "ami-004961349a19d7a8f"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name_dev
  }
}

resource "aws_instance" "web_server_stg" {
  provider      = aws.frankfurt
  ami           = "ami-098efcc0d4f80810e"
  instance_type = "t2.micro"

  tags = {
    Name = "var.instance_name_stg"
  }
}

resource "aws_sns_topic" "cpu_alarm_dev" {
  name     = "cpu-utilization-alarm"
  provider = aws.london
}

resource "aws_sns_topic" "cpu_alarm_stg" {
  name     = "cpu-utilization-alarm"
  provider = aws.frankfurt
}

module "cw_alarms_london_dev" {
  source              = "./modules/cloudwatch-alarms-module"
  alarm_name          = "cpu-util-dev"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "60"
  statistic           = "Average"
  threshold           = 80
  alarm_description   = "This metric monitors EC2 CPU utilization"
  alarm_actions       = [aws_sns_topic.cpu_alarm_dev.arn]

  dimensions = {
    InstanceId = "aws_instance.web_server_dev.id"
  }

  providers = {
    aws = aws.london
  }
}

module "cw_alarms_frankfurt_stg" {
  source              = "./modules/cloudwatch-alarms-module"
  alarm_name          = "cpu-util-stg"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 3
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "60"
  statistic           = "Average"
  threshold           = 90
  alarm_description   = "This metric monitors EC2 CPU utilization"
  alarm_actions       = [aws_sns_topic.cpu_alarm_stg.arn]

  dimensions = {
    InstanceId = aws_instance.web_server_stg.id
  }

  providers = {
    aws = aws.frankfurt
  }
}