project_name  = "terraform-secure-foundation"
environment   = "prod"
aws_region    = "us-east-1"
owner         = "Fernando"
cost_center   = "LAB-003"
business_unit = "Architecture"

vpc_cidr = "10.30.0.0/16"

public_subnet_cidrs = [
  "10.30.1.0/24",
  "10.30.2.0/24"
]

private_subnet_cidrs = [
  "10.30.11.0/24",
  "10.30.12.0/24"
]