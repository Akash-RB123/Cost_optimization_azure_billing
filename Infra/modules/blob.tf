
resource "azurerm_storage_account" "billing_blob" {
  name                     = "billingblobstore"
  resource_group_name      = var.resource_group
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_management_policy" "lifecycle" {
  storage_account_id = azurerm_storage_account.billing_blob.id

  rule {
    name    = "archive-old-records"
    enabled = true

    filters {
      prefix_match = ["billing-records/"]
      blob_types   = ["blockBlob"]
    }

    actions {
      base_blob {
        tier_to_cool_after_days_since_modification_greater_than    = 30
        tier_to_archive_after_days_since_modification_greater_than = 180
      }
    }
  }
}

