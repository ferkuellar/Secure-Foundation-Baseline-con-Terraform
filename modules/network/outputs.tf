output "module_name" {
  description = "Name of the module."
  value       = "network"
}

output "module_tags" {
  description = "Effective tags for the module."
  value       = local.module_tags
}