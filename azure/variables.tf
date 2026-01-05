variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
  default     = "rg-crosscloud-backup"
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "East US"
}

variable "storage_account_name" {
  description = "Name of the Azure Storage Account"
  type        = string
  default     = "crosscloudstorageacct"
}

variable "container_name" {
  description = "Name of the Blob container"
  type        = string
  default     = "s3backup"
}