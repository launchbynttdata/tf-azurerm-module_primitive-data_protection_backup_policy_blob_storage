output "id" {
  description = "Resource ID of the Blob Storage backup policy."
  value       = azurerm_data_protection_backup_policy_blob_storage.policy.id
}

output "name" {
  description = "Name of the Blob Storage backup policy."
  value       = azurerm_data_protection_backup_policy_blob_storage.policy.name
}
