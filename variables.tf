variable "rg_name" {
  description = "The name of the resource group"
  default     = "rg-migration-prod"
}

variable "location" {
  description = "Azure region for resources"
  default     = "westeurope"
}

variable "subscription_id" {
  description = "Azure Subscription ID"
}
