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


resource "azurerm_resource_group" "rg" {
  name     = "rg-crosscloud-backup-pune"
  location = "Central India"
}

resource "azurerm_storage_account" "storage" {
  name                     = "swapnilbackupacct"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  enable_https_traffic_only = true
}

resource "azurerm_storage_container" "backup" {
  name                  = "s3backup"
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "private"
}