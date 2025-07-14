output "archive_blob_url" {
  description = "Base URL for accessing archived billing records"
  value       = "${azurerm_storage_account.billing_blob.primary_blob_endpoint}${azurerm_storage_container.archive_container.name}/"
}
