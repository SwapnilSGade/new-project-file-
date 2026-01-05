variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
  default     = "rg-crosscloud-backup-pune"
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "Central India"
}

variable "storage_account_name" {
  description = "Name of the Azure Storage Account"
  type        = string
  default     = "swapnilbackupacct"
}

variable "container_name" {
  description = "Name of the Blob container"
  type        = string
  default     = "awsbackup"
}