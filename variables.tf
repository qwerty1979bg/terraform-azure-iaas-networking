variable "ApplicationName" {
  description = "The name of the system."
  type        = string
}

variable "Environment" {
  description = "Devtest or Prod"
  type        = string
}
variable "Region" {
  description = "Region where app is going to be deployed either primary or secondary"
  type        = string
}

variable "AZRegion" {
  description = "Region where app is going to be deployed Azure Specific either NC or SC"
  type = "map"
    default = {
        Primary  = "NC"
	      Secondary = "SC"
    }
}

variable "AppSubnet" {
  description = "Subnet of the application for example 10.6.12.32/28"
  type        = string
}


variable "VNet" {
    description = "Available Vnets to deploy to"
    type = "map"
    default = {
        NC-Prod  = "BDOUS-NC-Prod-VNET-10.4.12.0_22"
	      NC-DevTest = "BDOUS-NC-DevTest-VNet-10.6.12.0_22"
	      SC-Prod = "BDOUS-SC-Prod-SharedServices-VNET-10.5.0.0_22"
	      SC-DevTest = "BDOUS-SC-DevTest-SharedServices-VNET-10.7.0.0_22"

    }
}