resource "azurerm_application_insights" "billing_insights" {
  name                = "appinsights-billing"
  location            = var.location
  resource_group_name = var.resource_group_name
  application_type    = "web"
}

resource "azurerm_log_analytics_workspace" "billing_logs" {
  name                = "log-billing"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_monitor_action_group" "billing_alert_group" {
  name                = "billing-alert-group"
  resource_group_name = var.resource_group_name
  short_name          = "billingAG"

  email_receiver {
    name                    = "billing-alert-email"
    email_address           = "alerts@example.com"
    use_common_alert_schema = true
  }
}

resource "azurerm_monitor_metric_alert" "function_error_alert" {
  name                = "function-error-alert"
  resource_group_name = var.resource_group_name
  scopes              = [azurerm_function_app.billing_api.id]
  description         = "Alert on high error rate in billing function"
  severity            = 2
  frequency           = "PT5M"
  window_size         = "PT5M"
  enabled             = true

  criteria {
    metric_namespace = "Microsoft.Web/sites"
    metric_name      = "Http5xx"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 5
  }

  action {
    action_group_id = azurerm_monitor_action_group.billing_alert_group.id
  }
}
