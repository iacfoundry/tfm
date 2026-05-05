
### DATABRICKS_WORKSPACE MODULE
## Updated 02/11/2024 18:49:44

# DATABRICKS_WORKSPACE_DATA.TFVARS EXAMPLE
```
azurerm_databricks_workspace_data = {
  example-workspace = {
    enabled                = true
    name                   = "example-databricks"
    resource_group_name    = "example-resource-group"
    location               = "East US"
    sku                    = "standard"

    customer_managed_key_enabled = true
    infrastructure_encryption_enabled = false
    load_balancer_backend_address_pool_id = "load-balancer-backend-id"
    managed_disk_cmk_key_vault_key_id = "managed-disk-cmk-key-id"
    managed_disk_cmk_rotation_to_latest_version_enabled = true
    managed_resource_group_name = "managed-resource-group"
    managed_services_cmk_key_vault_key_id = "managed-services-cmk-key-id"
    network_security_group_rules_required = true
    public_network_access_enabled = true
    tags = {
      environment = "production"
      cost_center = "12345"
    }

    custom_parameters = {
      machine_learning_workspace_id = "ml-workspace-id"
      nat_gateway_name = "nat-gateway"
      no_public_ip = false
      private_subnet_name = "private-subnet"
      private_subnet_network_security_group_association_id = "private-subnet-nsg-association-id"
      public_ip_name = "public-ip"
      public_subnet_name = "public-subnet"
      public_subnet_network_security_group_association_id = "public-subnet-nsg-association-id"
      storage_account_name = "storage-account"
      storage_account_sku_name = "Standard_LRS"
      virtual_network_id = "virtual-network-id"
      vnet_address_prefix = "10.0.0.0/16"
    }
  }
}
```

# DATABRICKS_WORKSPACE MAIN.TF MODULE REFERENCE
```
module "azurerm_databricks_workspace" {
        source = "./modules/azurerm/databricks_workspace"

        azurerm_databricks_workspace_data = module._defaults.merge["databricks_workspace"]
}
```

# DATABRICKS_WORKSPACE DEFAULTS TAGS.LOCAL.TF
```
databricks_workspace = true
```

# DATABRICKS_WORKSPACE DEFAULTS DEFAULTS_MERGE.LOCAL.TF
```
azurerm_databricks_workspace = { for k, v in var.azurerm_databricks_workspace_data : k => merge(v, try(local.tags_used["databricks_workspace"], false) ? { tags = merge(var.global_defaults.tags, var.environment_defaults.tags, v.tags) } : {}) }
```

# DATABRICKS_WORKSPACE DEFAULTS DEFAULTS.VARIABLES.TF
```
variable "databricks_workspace_data" { default = {} }
```

# DATABRICKS_WORKSPACE ROOT VARIABLES.TF
```
variable "databricks_workspace_data" {
  type = map(object({
    # Required
    enabled            = bool
    name               = string
    resource_group_name = string
    location = optional(string)
    sku                = string

    # Optional
    customer_managed_key_enabled                        = optional(bool)
    infrastructure_encryption_enabled                   = optional(bool)
    load_balancer_backend_address_pool_id               = optional(string)
    managed_disk_cmk_key_vault_key_id                   = optional(string)
    managed_disk_cmk_rotation_to_latest_version_enabled = optional(bool)
    managed_resource_group_name                         = optional(string)
    managed_services_cmk_key_vault_key_id               = optional(string)
    network_security_group_rules_required               = optional(bool)
    public_network_access_enabled                       = optional(bool)
    tags                                                = optional(map(string))

    # Optional Dynamic Blocks
    custom_parameters = optional(object({
      machine_learning_workspace_id                          = optional(string)
      nat_gateway_name                                       = optional(string)
      no_public_ip                                           = optional(bool)
      private_subnet_name                                    = optional(string)
      private_subnet_network_security_group_association_id   = optional(string)
      public_ip_name                                         = optional(string)
      public_subnet_name                                     = optional(string)
      public_subnet_network_security_group_association_id    = optional(string)
      storage_account_name                                   = optional(string)
      storage_account_sku_name                               = optional(string)
      virtual_network_id                                     = optional(string)
      vnet_address_prefix                                    = optional(string)
    }))
  }))
  default = {}
}
```
