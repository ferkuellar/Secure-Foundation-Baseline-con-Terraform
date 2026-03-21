variable "project_name" {
  description = "Logical project name."
  type        = string
}

variable "environment" {
  description = "Environment name."
  type        = string
}

variable "aws_region" {
  description = "AWS region."
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

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
}

variable "public_subnet_cidrs" {
  description = "List of public subnet CIDRs."
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of private subnet CIDRs."
  type        = list(string)
}