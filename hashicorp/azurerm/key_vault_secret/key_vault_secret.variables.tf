variable "azurerm_key_vault_secret_data" {
  type = map(object({
    # Required
    enabled        = bool
    key_vault_id   = optional(string) # Set to Optional for allowed lookup by name value
    key_vault_name = optional(string) # Optional alias for key_vault_id
    name           = string

    # Optional
    content_type     = optional(string)
    expiration_date  = optional(string)
    not_before_date  = optional(string)
    tags             = optional(map(string))
    value            = optional(string)
    value_wo         = optional(string)
    value_wo_version = optional(number)
  }))
  default = {}
}
