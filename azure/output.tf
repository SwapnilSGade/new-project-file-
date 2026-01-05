output "storage_account_name" {
  description = "Azure Storage Account name"
  value       = azurerm_storage_account.storage.name
}

output "storage_container_name" {
  description = "Azure Blob container name"
  value       = azurerm_storage_container.backup.name
}

output "storage_account_primary_blob_endpoint" {
  description = "Primary Blob endpoint for the storage account"
  value       = azurerm_storage_account.storage.primary_blob_endpoint
}