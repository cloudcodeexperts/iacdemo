# Resource Group Varilables # 
#############################

# Define a resource group name
variable "rg_name" { 
    type = string 
}

# Define a resource group location 
variable "rg_location" { 
    type = string 
}

# Define tags 
variable "rg_tags" { 
    type = map(string) 
}

# Web APP Service Plan Varilables # 
###################################

# Define a web app service plan name
variable "webapp_svc_name" { 
    type = string 
}

# Define a web app service plan kind
variable "webapp_svc_os" { 
    type = string 
}

# Define a web app service plan sku tier
variable "webapp_svc_tier" { 
    type = string 
}

# Define a web app service plan sku size
variable "webapp_svc_size" { 
    type = string 
}

# Define a web app service plan reserved
# Mandatory for Linux plans
variable "webapp_svc_reserved" { 
    type = string 
}

# Define tags 
variable "webapp_svc_tags" { 
    type = map(string) 
}


# Web APP Varilables # 
######################

# Define a web app name
variable "web_app_container_name" { 
    type = string 
}

# Assign a web app storage
variable "web_app_container_storage" { 
    type = string 
}

# Define a web app docker image
variable "web_app_container_image" { 
    type = string 
}

# Define a web app always on or not
variable "web_app_container_always_on" { 
    type = string 
}

# Define a docker registry url
variable "web_app_docker_registry_url" { 
    type = string 
}

# Define tags 
variable "web_app_container_tags" { 
    type = map(string) 
}