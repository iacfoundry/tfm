variable "azurerm_key_vault_data" {
  type = map(object({
    # Required
    enabled = bool
    location = string
    name = string
    resource_group_name = optional(string) # Set to Optional for allowed lookup by name value
    sku_name = string
    tenant_id = optional(string) # Set to Optional for allowed lookup by name value
    tenant_name = optional(string) # Optional alias for tenant_id
    
    # Optional
    access_policy = optional(list(object({
      application_id = string,
      certificate_permissions = list(string),
      key_permissions = list(string),
      object_id = string,
      secret_permissions = list(string),
      storage_permissions = list(string),
      tenant_id = string
    })))
    enable_rbac_authorization = optional(bool)
    enabled_for_deployment = optional(bool)
    enabled_for_disk_encryption = optional(bool)
    enabled_for_template_deployment = optional(bool)
    public_network_access_enabled = optional(bool)
    purge_protection_enabled = optional(bool)
    rbac_authorization_enabled = optional(bool)
    soft_delete_retention_days = optional(number)
    tags = optional(map(string))
    # Optional block: contact
    contact = optional(object({
    # Required
    email = string
    
    # Optional
    name = optional(string)
    phone = optional(string)
  }))
    # Optional block: network_acls
    network_acls = optional(object({
    # Required
    bypass = string
    default_action = string
    
    # Optional
    ip_rules = optional(set(string))
    virtual_network_subnet_ids = optional(set(string)) # Set to Optional for allowed lookup by name value
    virtual_network_subnet_names = optional(list(string)) # Optional alias for virtual_network_subnet_ids
  }))
  }))
  default = {}
}
