variable "databricks_account_id" {
  type        = string
  description = "Databricks Account ID"
}

variable "databricks_account_client_id" {
  type        = string
  description = "Application ID of account-level service principal"
}

variable "databricks_account_client_secret" {
  type        = string
  description = "Client secret of account-level service principal"
  sensitive   = true
}

variable "tags" {
  default     = {}
  type        = map(string)
  description = "Optional tags to add to created resources"
}

variable "cidr_block" {
  description = "IP range for AWS VPC"
  type        = string
  default     = "10.4.0.0/16"
}

variable "region" {
  default     = "us-east-1"
  type        = string
  description = "AWS region to deploy to"
}

variable "prefix" {
  default     = ""
  type        = string
  description = "Prefix for use in the generated names"
}
