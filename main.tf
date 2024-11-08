# main.tf

# Reference an existing Resource Group
data "azurerm_resource_group" "existing_rg" {
  name = var.resource_group_name
}

# Create the App Service Plan with Free SKU (F1) inside the existing Resource Group
resource "azurerm_app_service_plan" "app_service_plan" {
  name                = var.app_service_plan_name
  location            = data.azurerm_resource_group.existing_rg.location
  resource_group_name = data.azurerm_resource_group.existing_rg.name

  sku {
    tier = "Free"
    size = "F1"
  }
}

# Create the App Service within the existing Resource Group
resource "azurerm_app_service" "app_service" {
  name                = var.app_service_name
  location            = data.azurerm_resource_group.existing_rg.location
  resource_group_name = data.azurerm_resource_group.existing_rg.name
  app_service_plan_id = azurerm_app_service_plan.app_service_plan.id

}

# Create Azure Container Registry
resource "azurerm_container_registry" "acr" {
  name                     = var.acr_name
  resource_group_name      = data.azurerm_resource_group.existing_rg.name
  location                 = data.azurerm_resource_group.existing_rg.location
  sku                      = "Basic"  # You can change the SKU to "Standard" or "Premium" depending on needs
  admin_enabled            = true     # Enables admin user authentication for ACR
}
