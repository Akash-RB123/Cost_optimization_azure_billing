resource "azurerm_function_app" "billing_api" {
  name                       = "billing-api-func"
  location                   = var.location
  resource_group_name        = var.resource_group
  app_service_plan_id        = azurerm_app_service_plan.plan.id
  storage_account_name       = azurerm_storage_account.billing_blob.name
  storage_account_access_key = azurerm_storage_account.billing_blob.primary_access_key
}
