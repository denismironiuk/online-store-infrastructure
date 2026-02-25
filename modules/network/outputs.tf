output "subnet_id" {
  description = "ID of the subnet for AKS integration"
  value       = azurerm_subnet.aks_subnet.id
}
