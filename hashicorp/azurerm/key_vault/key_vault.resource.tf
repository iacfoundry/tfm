resource "azurerm_key_vault" "key_vault" {
  for_each = { for key, value in var.azurerm_key_vault_data : key => value if value.enabled }

# Required Arguments
  location = each.value.location
  name = each.value.name
  resource_group_name = each.value.resource_group_name
  sku_name = each.value.sku_name
  tenant_id = coalesce(
    try(each.value.tenant_id, null),
    try(var.azurerm_tenant_output["${each.value.tenant_name}"].id, null)
  )

# Optional Arguments
  access_policy = each.value.access_policy
  enable_rbac_authorization = each.value.enable_rbac_authorization
  enabled_for_deployment = each.value.enabled_for_deployment
  enabled_for_disk_encryption = each.value.enabled_for_disk_encryption
  enabled_for_template_deployment = each.value.enabled_for_template_deployment
  public_network_access_enabled = each.value.public_network_access_enabled
  purge_protection_enabled = each.value.purge_protection_enabled
  rbac_authorization_enabled = each.value.rbac_authorization_enabled
  soft_delete_retention_days = each.value.soft_delete_retention_days
  tags = each.value.tags



dynamic "contact" {
    for_each = each.value.contact != null ? each.value.contact : []
    content {
      # Required Arguments
      email = contact.value.email

      # Optional Arguments
      name = contact.value.name
      phone = contact.value.phone

    }
  }

  dynamic "network_acls" {
    for_each = each.value.network_acls != null ? each.value.network_acls : []
    content {
      # Required Arguments
      bypass = network_acls.value.bypass
      default_action = network_acls.value.default_action

      # Optional Arguments
      ip_rules = network_acls.value.ip_rules
      virtual_network_subnet_ids = try(coalesce(
        try(network_acls.value.virtual_network_subnet_ids, null),
        try([for name in network_acls.value.virtual_network_subnet_names : var.azurerm_subnet_output[name].id], null)
      ), null)

    }
  }

  lifecycle {
    prevent_destroy = false
  }
}