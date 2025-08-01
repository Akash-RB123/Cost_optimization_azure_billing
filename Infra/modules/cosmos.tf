resource "azurerm_cosmosdb_account" "billing" {
  name                = "cosmos-billing"
  location            = var.location
  resource_group_name = var.resource_group_name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"

  consistency_policy {
    consistency_level = "Session"
  }

  geo_location {
    location          = var.location
    failover_priority = 0
  }

  capabilities {
    name = "EnableServerless"
  }

  tags = {
    environment = "dev"
    owner       = "billing-team"
  }
}
