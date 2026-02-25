terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.0"
    }
  }

  # Secure Remote Backend for state management
  backend "azurerm" {
    resource_group_name  = "rg-migration-prod"
    storage_account_name = "den4iktfstate1740492801"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

# Helm provider allows Terraform to manage Kubernetes applications
provider "helm" {
  kubernetes {
    host                   = module.aks.kube_host
    client_certificate     = base64decode(module.aks.client_certificate)
    client_key             = base64decode(module.aks.client_key)
    cluster_ca_certificate = base64decode(module.aks.cluster_ca_certificate)
  }
}
