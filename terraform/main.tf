# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Azure provider with credentials
provider "azurerm" {
  features {}
}

# Create an Azure Resource Group
resource "azurerm_resource_group" "ressource_group" {
  name     = "Databricks-Serving-Endpoint-Test"
  location = "West Europe"
}

# Create a Databricks Workspace
resource "azurerm_databricks_workspace" "databricks_workspace_dev" {
  name                = "Databricks-Serving-Endpoint-Dev"
  resource_group_name = azurerm_resource_group.ressource_group.name
  location            = azurerm_resource_group.ressource_group.location
  sku                 = "standard"
}

# Create a Databricks Workspace
resource "azurerm_databricks_workspace" "databricks_workspace_prod" {
  name                = "Databricks-Serving-Endpoint-Prod"
  resource_group_name = azurerm_resource_group.ressource_group.name
  location            = azurerm_resource_group.ressource_group.location
  sku                 = "standard"
}
