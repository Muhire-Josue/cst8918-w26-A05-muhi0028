output "resource_group_name" {
  description = "Resource group name"
  value       = azurerm_resource_group.rg.name
}

output "public_ip_address" {
  description = "Public IP address of the web server"
  value       = azurerm_public_ip.pip.ip_address
}