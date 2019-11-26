terraform {
  required_version = ">= 0.12"
}

#Resource Group for Application
resource "azurerm_resource_group" "AppRG" {
    name     = "BDOUS-${var.Environment}-${var.ApplicationName}-RG"
    location = var.AZRegion[var.Region] == "NC" ? "North Central US" : "South Central US"
}

#Assign Default NSG
data "azurerm_network_security_group" "DefaultNSG" {
  name                = "BDOUS-${var.AZRegion[var.Region]}-${var.Environment}-Internal-nsg"
  resource_group_name = "BDOUS-${var.Environment}-SharedServices-RG"
}


#Create Subnet
resource "azurerm_subnet" "AppSubnet" {
  name                 = "BDOUS-${var.Environment}-${var.AZRegion[var.Region]}-${var.ApplicationName}-Subnet"
  resource_group_name  = "BDOUS-${var.Environment}-SharedServices-RG"
  virtual_network_name = "${lookup(var.VNet, "${var.AZRegion[var.Region]}-${var.Environment}", "NC-DevTest")}"
  address_prefix       = var.AppSubnet
}

#Create Subnet Association
resource "azurerm_subnet_network_security_group_association" "SubnetAssoc" {
  subnet_id                 = azurerm_subnet.AppSubnet.id
  network_security_group_id = data.azurerm_network_security_group.DefaultNSG.id
}


