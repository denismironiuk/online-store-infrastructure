module "network" {
  source              = "./modules/network"
  resource_group_name = var.rg_name
  location            = var.location
  vnet_name           = "vnet-prod"
}

module "aks" {
  source              = "./modules/aks"
  cluster_name        = "aks-prod"
  resource_group_name = var.rg_name
  location            = var.location
  subnet_id           = module.network.subnet_id
}

# Deploy all K8s internal tools automatically after cluster is ready
module "k8s_addons" {
  source     = "./modules/k8s-addons"
  depends_on = [module.aks]
}
