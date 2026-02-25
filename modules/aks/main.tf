# Managed Kubernetes Service (AKS) Configuration
resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "${var.cluster_name}-dns"
  kubernetes_version  = "1.34.2"

  # Default Node Pool with Autoscaling enabled for production stability
  default_node_pool {
    name                = "agentpool"
    node_count          = var.node_count
    vm_size             = "Standard_D2s_v6"
    vnet_subnet_id      = var.subnet_id
    enable_auto_scaling = true
    min_count           = 1
    max_count           = 5
    zones               = ["1", "2", "3"] # High Availability (HA) zones
  }

  # Use Managed Identity for better security (No passwords stored)
  identity {
    type = "SystemAssigned"
  }

  # Azure CNI Overlay: Efficient pod networking with dedicated IP management
  network_profile {
    network_plugin      = "azure"
    network_plugin_mode = "overlay"
    network_policy      = "azure"
  }

  # Important: Explicitly defining authorized IP ranges (empty for global access in this lab)
  api_server_authorized_ip_ranges = []
}
