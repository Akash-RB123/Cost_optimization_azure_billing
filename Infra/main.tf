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
  name     = "billing-rg"
  location = var.location
}

module "cosmos" {
  source = "./cosmos.tf"
}

module "blob" {
  source = "./blob.tf"
}

module "functions" {
  source = "./functions.tf"
}

module "cdn" {
  source = "./cdn.tf"
}

module "monitoring" {
  source = "./monitoring.tf"
}
