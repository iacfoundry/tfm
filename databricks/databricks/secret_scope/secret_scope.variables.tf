variable "databricks_secret_scope_data" {
  type = map(object({
    # Required  
    enabled = bool
    name    = string

    # Optional  
    initial_manage_principal = optional(string)
    keyvault_metadata = optional(object({
      resource_id   = optional(string)
      resource_name = optional(string)
      dns_name      = optional(string)
    }))
  }))
  default = {}
}

variable "azurerm_key_vault_output" {
  default = {}
}
