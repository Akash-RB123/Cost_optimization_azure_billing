variable "location" {
  description = "Azure region for resource deployment"
  type        = string
  default     = "East US"
}

variable "resource_group_name" {
  description = "Name of the Azure resource group"
  type        = string
}

# Blob Storage
variable "blob_storage_name" {
  description = "Name of the Blob Storage account"
  type        = string
  default     = "billingblobstore"
}

variable "blob_container_name" {
  description = "Name of the Blob container for archived records"
  type        = string
  default     = "billing-archive"
}

# Cosmos DB
variable "cosmos_account_name" {
  description = "Name of the Cosmos DB account"
  type        = string
  default     = "cosmos-billing"
}

# Azure Functions
variable "function_app_name" {
  description = "Name of the Azure Function App"
  type        = string
  default     = "billing-api-func"
}

variable "function_storage_name" {
  description = "Storage account name for Function App"
  type        = string
  default     = "billingfuncstore"
}

variable "app_service_plan_id" {
  description = "ID of the App Service Plan for Function App"
  type        = string
}

variable "app_insights_key" {
  description = "Instrumentation key for Application Insights"
  type        = string
}

# CDN
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

# Monitoring
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
