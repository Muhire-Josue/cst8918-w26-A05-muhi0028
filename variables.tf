variable "labelPrefix" {
  description = "Your college username. This will prefix resource names."
  type        = string
}

variable "region" {
  description = "Azure region to deploy resources into."
  type        = string
  default     = "canadacentral"
}

variable "admin_username" {
  description = "Admin username for the VM."
  type        = string
  default     = "azureadmin"
}