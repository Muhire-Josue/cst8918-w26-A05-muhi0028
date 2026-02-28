variable "labelPrefix" {
  description = "Your college username. This will prefix resource names."
  type        = string
}

variable "region" {
  description = "Azure region to deploy resources into."
  type        = string
  default     = "southafricanorth"
}

variable "admin_username" {
  description = "Admin username for the VM."
  type        = string
  default     = "azureadmin"
}

variable "ssh_public_key_path" {
  description = "Path to your SSH public key (e.g., ~/.ssh/id_rsa.pub)"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}