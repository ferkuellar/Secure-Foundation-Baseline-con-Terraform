variable "project_name" {
  description = "Logical name of the project."
  type        = string

  validation {
    condition     = length(var.project_name) >= 3 && length(var.project_name) <= 30
    error_message = "project_name must be between 3 and 30 characters."
  }
}

variable "environment" {
  description = "Deployment environment."
  type        = string

  validation {
    condition     = contains(["dev", "qa", "prod"], var.environment)
    error_message = "environment must be one of: dev, qa, prod."
  }
}

variable "aws_region" {
  description = "AWS region for deployment."
  type        = string

  validation {
    condition     = can(regex("^[a-z]{2}-[a-z]+-\\d$", var.aws_region))
    error_message = "aws_region must look like a valid AWS region, for example us-east-1."
  }
}

variable "owner" {
  description = "Owner of the deployment."
  type        = string
}

variable "cost_center" {
  description = "Cost center or finance tracking code."
  type        = string
}

variable "business_unit" {
  description = "Business unit associated with the deployment."
  type        = string
}

variable "managed_by" {
  description = "Tool responsible for provisioning."
  type        = string
  default     = "terraform"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string

  validation {
    condition     = can(cidrhost(var.vpc_cidr, 0))
    error_message = "vpc_cidr must be a valid CIDR block."
  }
}

variable "public_subnet_cidrs" {
  description = "Public subnet CIDR blocks."
  type        = list(string)

  validation {
    condition     = length(var.public_subnet_cidrs) >= 1
    error_message = "At least one public subnet CIDR must be provided."
  }
}

variable "private_subnet_cidrs" {
  description = "Private subnet CIDR blocks."
  type        = list(string)

  validation {
    condition     = length(var.private_subnet_cidrs) >= 1
    error_message = "At least one private subnet CIDR must be provided."
  }
}