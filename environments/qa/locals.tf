locals {
  project_code = lower(replace(var.project_name, "_", "-"))
  env_code     = lower(var.environment)
  region_code  = lower(var.aws_region)

  name_prefix = "${local.project_code}-${local.env_code}"

  common_tags = {
    Project      = var.project_name
    Environment  = var.environment
    Owner        = var.owner
    CostCenter   = var.cost_center
    BusinessUnit = var.business_unit
    ManagedBy    = var.managed_by
    Repository   = "terraform-secure-foundation"
  }
}