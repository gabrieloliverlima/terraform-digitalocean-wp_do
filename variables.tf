variable "region" {
  type        = string
  default     = "nyc1"
  description = "Região das VMs"
}

variable "wp_vm_count" {
  type        = number
  default     = 2
  description = "Quantidade de Droplet"

  validation {
    condition     = var.wp_vm_count > 1
    error_message = "O número mínimo de VMs são duas"
  }

}

variable "vms_ssh" {
  type        = string
  description = "Chave SSH para as VMs"
}

