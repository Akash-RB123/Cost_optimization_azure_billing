terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "billing_rg" {
  name     = var.resource_group
  location = var.location
}

# Load Cosmos DB setup
module "cosmos" {
  source = "./cosmos.tf"
}

# Load Blob Storage setup
module "blob" {
  source = "./blob.tf"
}

# Load Function App and Durable Functions
module "functions" {
  source = "./functions.tf"
}

# Load Azure CDN configuration
module "cdn" {
  source = "./cdn.tf"
}

# Load monitoring and alerting setup
module "monitoring" {
  source = "./monitoring.tf"
}
