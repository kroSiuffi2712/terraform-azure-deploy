# variables.tf

# Name of the existing Resource Group to use
variable "resource_group_name" {
  description = "Name of the existing resource group"
  type        = string
}

# Location for other resources (can match the resource group’s location)
variable "location" {
  description = "Location where resources will be deployed"
  type        = string
  default     = "East US"
}

# Name of the App Service
variable "app_service_name" {
  description = "Name of the App Service"
  type        = string
}

# Name of the App Service Plan
variable "app_service_plan_name" {
  description = "Name of the App Service plan"
  type        = string
}

# Name of the Azure Container Registry
variable "acr_name" {
  description = "The name of the Azure Container Registry"
  type        = string
}

