# -----------------------------------------
# Terraform Module
# Contributor(s): William Robinson
# Updated: March 2026
# Purpose: Terraform Resource Module
# -----------------------------------------
resource "azurerm_databricks_workspace" "databricks_workspace" {
  for_each = { for key, value in var.azurerm_databricks_workspace_data : key => value if value.enabled }

  # Required Arguments
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  sku                 = each.value.sku


  # Required Blocks 



  # Optional Arguments
  customer_managed_key_enabled                        = each.value.customer_managed_key_enabled
  infrastructure_encryption_enabled                   = each.value.infrastructure_encryption_enabled
  load_balancer_backend_address_pool_id               = each.value.load_balancer_backend_address_pool_id
  managed_disk_cmk_key_vault_key_id                   = each.value.managed_disk_cmk_key_vault_key_id
  managed_disk_cmk_rotation_to_latest_version_enabled = each.value.managed_disk_cmk_rotation_to_latest_version_enabled
  managed_resource_group_name                         = each.value.managed_resource_group_name
  managed_services_cmk_key_vault_key_id               = each.value.managed_services_cmk_key_vault_key_id
  network_security_group_rules_required               = each.value.network_security_group_rules_required
  public_network_access_enabled                       = each.value.public_network_access_enabled
  tags                                                = each.value.tags

  # Optional Dynamic Blocks
  dynamic "custom_parameters" {

    for_each = each.value.custom_parameters != null ? [1] : []

    content {
      # Required

      # Optional
      machine_learning_workspace_id = each.value.custom_parameters.machine_learning_workspace_id
      nat_gateway_name              = each.value.custom_parameters.nat_gateway_name
      no_public_ip                  = each.value.custom_parameters.no_public_ip
      private_subnet_name           = each.value.custom_parameters.private_subnet_name
      private_subnet_network_security_group_association_id = coalesce(
        try(each.value.custom_parameters.private_subnet_network_security_group_association_id, null),
        try(var.azurerm_subnet_network_security_group_association_output["${each.value.custom_parameters.private_subnet_network_security_group_association_key}"].id, null)
      )
      public_ip_name     = each.value.custom_parameters.public_ip_name
      public_subnet_name = each.value.custom_parameters.public_subnet_name
      public_subnet_network_security_group_association_id = coalesce(
        try(each.value.custom_parameters.public_subnet_network_security_group_association_id, null),
        try(var.azurerm_subnet_network_security_group_association_output["${each.value.custom_parameters.public_subnet_network_security_group_association_key}"].id, null)
      )
      storage_account_name     = each.value.custom_parameters.storage_account_name
      storage_account_sku_name = each.value.custom_parameters.storage_account_sku_name
      virtual_network_id = coalesce(
        try(each.value.custom_parameters.virtual_network_id, null),
        try(var.azurerm_virtual_network_output["${each.value.custom_parameters.virtual_network_name}"].id, null)
      )
      vnet_address_prefix = each.value.custom_parameters.vnet_address_prefix
    }
  }



  lifecycle {
    prevent_destroy = false
  }
}
