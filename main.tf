# Define Azure provider
provider "azurerm" {
    version = "2.14.0"
    features {}
}

# Define Web App Container module
module "web_container_us2w" {
    source               = "./web_container"

    # Define a resource group variables
    rg_name  = "web_us2w_rg"
    rg_location  = "westus2"
    rg_tags      = { Environment = "Development"
                     Version     = "1.0"
                   }  

    # Define a web app service plan variables 
    webapp_svc_name      = "webapp_svc_plan"
    webapp_svc_os        = "Linux"
    webapp_svc_tier      = "Standard"
    webapp_svc_size      = "S1"
    webapp_svc_reserved  = "true"
    webapp_svc_tags      = { Environment = "Development"
                             Version     = "1.0"
                           }

    # Define a web app service plan variables
    web_app_container_name      = "webapp-container-2020"
    web_app_container_storage   = "false"
    web_app_container_image     = "abujojupwork/web:v1"
    web_app_container_always_on = "true"
    web_app_docker_registry_url = "https://index.docker.io"
    web_app_container_tags      = { Environment = "Development"
                                    Version     = "1.0"
                                  }  
}