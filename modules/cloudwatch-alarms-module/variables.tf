# variable "sns_topic" {
#   type        = string
#   description = "The SNS topic to which the alarm will send notifications"
# }

variable "instance_id" {
  type        = any
  description = "AWS EC2 instance IDs that is to be monitored"
  default = null
}

variable "alarm_name" {
  type        = string
  description = "The nane of the CW alarm"
}

variable "evaluation_periods" {
  type        = number
  description = "The number of periods over which data is compared to the specified threshold."
}

variable "metric_name" {
  description = "The name for the alarm's associated metric. See docs for supported metrics."
  type        = string
  default     = null
}

variable "comparison_operator" {
  description = "The arithmetic operation to use when comparing the specified Statistic and Threshold. The specified Statistic value is used as the first operand. Either of the following is supported: GreaterThanOrEqualToThreshold, GreaterThanThreshold, LessThanThreshold, LessThanOrEqualToThreshold."
  type        = string
}

variable "namespace" {
  description = "The namespace for the alarm's associated metric. See docs for the list of namespaces"
  type        = string
  default     = null
}

variable "period" {
  description = "The period in seconds over which the specified statistic is applied."
  type        = string
  default     = null
}

variable "statistic" {
  description = "The statistic to apply to the alarm's associated metric. Either of the following is supported: SampleCount, Average, Sum, Minimum, Maximum"
  type        = string
  default     = null
}

variable "threshold" {
  description = "The value against which the specified statistic is compared."
  type        = number
  default     = null
}

variable "alarm_description" {
  description = "The description for the alarm."
  type        = string
  default     = null
}

variable "dimensions" {
  description = "The dimensions for the alarm's associated metric."
  type        = any
  default     = null
}

variable "alarm_actions" {
  type = any
  default = null
}