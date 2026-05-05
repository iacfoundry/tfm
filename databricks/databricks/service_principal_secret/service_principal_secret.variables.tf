variable "databricks_service_principal_secret_data" {
  type = map(object({
    # Required
    enabled                = bool
    service_principal_id   = optional(string)
    service_principal_name = optional(string)
    provider_scope         = optional(string, "account")

    # Optional Key Vault Secret
    key_vault_id   = optional(string)
    key_vault_name = optional(string)
    secret_name    = optional(string)
  }))
  default = {}
}

variable "databricks_service_principal_output" {
  default = {}
}

variable "azurerm_key_vault_output" {
  default = {}
}
