# Create a new resoruce group
resource "azurerm_resource_group" "rg" {
    name         = var.rg_name
    location     = var.rg_location
    tags         = var.rg_tags 
}

# Create an Azure App Service Plan
resource "azurerm_app_service_plan" "web_app_service_plan" {
  name                = var.webapp_svc_name
  location            = var.rg_location
  resource_group_name = var.rg_name
  kind                = var.webapp_svc_os
  depends_on          = [azurerm_resource_group.rg] 
  tags                = var.webapp_svc_tags

  sku {
    tier              = var.webapp_svc_tier
    size              = var.webapp_svc_size
  }

  # Mandatory for Linux plans 
  reserved = var.webapp_svc_reserved
}

# Create an Azure Web App 
resource "azurerm_app_service" "web_app_container" {
  name                                  = var.web_app_container_name
  location                              = var.rg_location
  resource_group_name                   = var.rg_name
  app_service_plan_id                   = azurerm_app_service_plan.web_app_service_plan.id
  depends_on                            = [azurerm_app_service_plan.web_app_service_plan]
  tags                                  = var.web_app_container_tags

  site_config {
    linux_fx_version                    = "DOCKER|${var.web_app_container_image}"
    always_on                           = var.web_app_container_always_on
  }

  app_settings = {
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = var.web_app_container_storage
    DOCKER_REGISTRY_SERVER_URL          = var.web_app_docker_registry_url
  }
}