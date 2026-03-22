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
  description = "Target VPC ID."
  type        = string
}

variable "private_subnet_id" {
  description = "Private subnet ID where the admin instance will be placed."
  type        = string
}

variable "admin_instance_type" {
  description = "EC2 instance type for admin host."
  type        = string
  default     = "t3.micro"
}

variable "allowed_egress_cidrs" {
  description = "CIDRs allowed for broad outbound traffic when needed."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "root_volume_size" {
  description = "Root EBS volume size in GiB."
  type        = number
  default     = 20
}