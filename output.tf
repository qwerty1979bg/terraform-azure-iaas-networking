output "AppRGName" {
  value       = azurerm_resource_group.AppRG.name
  description = "Name of Application RG"
}

output "AppRGLocation" {
  value       = azurerm_resource_group.AppRG.location
  description = "Location of the Application RG"
}

output "AppSubnet" {
  value       = azurerm_subnet.AppSubnet.id
  description = "Application Subnet"
}

output "Environment" {
  value       = var.Environment
  description = "Application environment DevTest or Prod"
}
