# -----------------------------------------
# Terraform Module
# Contributor(s): William Robinson
# Updated: March 2026
# Purpose: Terraform Resource Module
# -----------------------------------------
variable "azurerm_databricks_workspace_data" {
  type = map(object({
    # Required
    enabled             = bool
    name                = string
    resource_group_name = string
    location            = optional(string)
    sku                 = string

    # Optional
    customer_managed_key_enabled                        = optional(bool)
    infrastructure_encryption_enabled                   = optional(bool)
    load_balancer_backend_address_pool_id               = optional(string)
    managed_disk_cmk_key_vault_key_id                   = optional(string)
    managed_disk_cmk_rotation_to_latest_version_enabled = optional(bool)
    managed_resource_group_name                         = optional(string)
    managed_services_cmk_key_vault_key_id               = optional(string)
    network_security_group_rules_required               = optional(string)
    public_network_access_enabled                       = optional(bool)
    tags                                                = optional(map(string))

    # Optional Dynamic Blocks
    custom_parameters = optional(object({
      machine_learning_workspace_id                         = optional(string)
      nat_gateway_name                                      = optional(string)
      no_public_ip                                          = optional(bool)
      private_subnet_name                                   = optional(string)
      private_subnet_network_security_group_association_id  = optional(string)
      private_subnet_network_security_group_association_key = optional(string)
      public_ip_name                                        = optional(string)
      public_subnet_name                                    = optional(string)
      public_subnet_network_security_group_association_id   = optional(string)
      public_subnet_network_security_group_association_key  = optional(string)
      storage_account_name                                  = optional(string)
      storage_account_sku_name                              = optional(string)
      virtual_network_id                                    = optional(string)
      virtual_network_name                                  = optional(string)
      vnet_address_prefix                                   = optional(string)
    }))
  }))
  default = {}
}

variable "azurerm_subnet_network_security_group_association_output" {
  default = {}
}

variable "azurerm_virtual_network_output" {
  default = {}
}
