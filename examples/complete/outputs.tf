output "policy_id" {
  description = "Resource ID of the Blob Storage backup policy."
  value       = module.blob_policy.id
}

output "resource_group_name" {
  description = "Name of the resource group containing the test resources."
  value       = module.resource_group.name
}

output "backup_vault_name" {
  description = "Name of the Recovery Services vault used by the example."
  value       = azurerm_recovery_services_vault.vault.name
}

output "backup_policy_name" {
  description = "Name of the Blob Storage backup policy."
  value       = module.blob_policy.name
}
