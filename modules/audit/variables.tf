variable "project_name" {
  description = "Logical project name."
  type        = string
}

variable "environment" {
  description = "Environment name."
  type        = string
}

variable "name_prefix" {
  description = "Computed resource naming prefix."
  type        = string
}

variable "common_tags" {
  description = "Standard tags map."
  type        = map(string)
}

variable "vpc_id" {
  description = "Target VPC ID for flow logs."
  type        = string
}

variable "enable_multi_region_trail" {
  description = "Whether the CloudTrail trail should be multi-region."
  type        = bool
  default     = true
}

variable "flow_logs_retention_days" {
  description = "Retention days for VPC Flow Logs log group."
  type        = number
  default     = 30
}

variable "cloudtrail_logs_retention_days" {
  description = "Retention days for CloudTrail CloudWatch log group."
  type        = number
  default     = 30
}