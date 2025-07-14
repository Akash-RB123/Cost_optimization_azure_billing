variable "location" {
  description = "Azure region for resource deployment"
  type        = string
  default     = "East US"
}

variable "resource_group" {
  description = "Name of the Azure resource group"
  type        = string
}

variable "cosmos_account_name" {
  description = "Name of the Cosmos DB account"
  type        = string
  default     = "cosmos-billing"
}

variable "blob_storage_name" {
  description = "Name of the Azure Blob Storage account"
  type        = string
  default     = "billingblobstore"
}

variable "function_app_name" {
  description = "Name of the Azure Function App"
  type        = string
  default     = "billing-api-func"
}

variable "cdn_profile_name" {
  description = "Name of the Azure CDN profile"
  type        = string
  default     = "billing-cdn-profile"
}

variable "cdn_endpoint_name" {
  description = "Name of the Azure CDN endpoint"
  type        = string
  default     = "billing-cdn-endpoint"
}

variable "app_insights_name" {
  description = "Name of the Application Insights instance"
  type        = string
  default     = "appinsights-billing"
}

variable "log_analytics_name" {
  description = "Name of the Log Analytics workspace"
  type        = string
  default     = "log-billing"
}

variable "alert_email" {
  description = "Email address to receive monitoring alerts"
  type        = string
  default     = "alerts@example.com"
}
