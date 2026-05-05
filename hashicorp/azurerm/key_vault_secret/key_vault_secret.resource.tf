resource "azurerm_key_vault_secret" "key_vault_secret" {
  for_each = { for key, value in var.azurerm_key_vault_secret_data : key => value if value.enabled }

  # Required Arguments
  key_vault_id = coalesce(
    try(each.value.key_vault_id, null),
    try(var.azurerm_key_vault_output["${each.value.key_vault_name}"].id, null)
  )
  name = each.value.name

  # Optional Arguments
  content_type     = each.value.content_type
  expiration_date  = each.value.expiration_date
  not_before_date  = each.value.not_before_date
  tags             = each.value.tags
  value            = each.value.value
  value_wo         = each.value.value_wo
  value_wo_version = each.value.value_wo_version





  lifecycle {
    prevent_destroy = false
  }
}