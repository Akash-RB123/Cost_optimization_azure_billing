resource "azurerm_cdn_profile" "billing_cdn" {
  name                = var.cdn_profile_name
  location            = var.location
  resource_group_name = var.resource_group
  sku                 = "Standard_Microsoft"
}

resource "azurerm_cdn_endpoint" "billing_endpoint" {
  name                = var.cdn_endpoint_name
  profile_name        = azurerm_cdn_profile.billing_cdn.name
  location            = var.location
  resource_group_name = var.resource_group

  origin {
    name      = "blob-origin"
    host_name = azurerm_storage_account.billing_blob.primary_blob_endpoint
  }

  is_http_allowed             = true
  is_https_allowed            = true
  optimization_type           = "GeneralWebDelivery"
  querystring_caching_behaviour = "IgnoreQueryString"
}

