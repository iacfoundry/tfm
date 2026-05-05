module "azurerm_custom_ip_prefix" {
  source = "./modules/hashicorp/azurerm/custom_ip_prefix"

  azurerm_custom_ip_prefix_data = var.azurerm_custom_ip_prefix_data
  # azurerm_parent_custom_ip_prefix_output = module.azurerm_parent_custom_ip_prefix.azurerm_parent_custom_ip_prefix_output_names
}

module "azurerm_key_vault" {
  source = "./modules/hashicorp/azurerm/key_vault"

  azurerm_key_vault_data = var.azurerm_key_vault_data
  azurerm_subnet_output = module.azurerm_subnet.azurerm_subnet_output_names
  # azurerm_tenant_output = module.azurerm_tenant.azurerm_tenant_output_names
}

module "azurerm_key_vault_secret" {
  source = "./modules/hashicorp/azurerm/key_vault_secret"

  azurerm_key_vault_secret_data = var.azurerm_key_vault_secret_data
  azurerm_key_vault_output = module.azurerm_key_vault.azurerm_key_vault_output_names
}

module "azurerm_nat_gateway" {
  source = "./modules/hashicorp/azurerm/nat_gateway"

  azurerm_nat_gateway_data = var.azurerm_nat_gateway_data
}

module "azurerm_nat_gateway_public_ip_association" {
  source = "./modules/hashicorp/azurerm/nat_gateway_public_ip_association"

  azurerm_nat_gateway_public_ip_association_data = var.azurerm_nat_gateway_public_ip_association_data
  azurerm_nat_gateway_output                     = module.azurerm_nat_gateway.azurerm_nat_gateway_output_names
  azurerm_public_ip_output                       = module.azurerm_public_ip.azurerm_public_ip_output_names
}

module "azurerm_nat_gateway_public_ip_prefix_association" {
  source = "./modules/hashicorp/azurerm/nat_gateway_public_ip_prefix_association"

  azurerm_nat_gateway_public_ip_prefix_association_data = var.azurerm_nat_gateway_public_ip_prefix_association_data
  azurerm_nat_gateway_output                            = module.azurerm_nat_gateway.azurerm_nat_gateway_output_names
  azurerm_public_ip_prefix_output                       = module.azurerm_public_ip_prefix.azurerm_public_ip_prefix_output_names
}

module "azurerm_network_security_group" {
  source = "./modules/hashicorp/azurerm/network_security_group"

  azurerm_network_security_group_data = var.azurerm_network_security_group_data
}

module "azurerm_public_ip" {
  source = "./modules/hashicorp/azurerm/public_ip"

  azurerm_public_ip_data = var.azurerm_public_ip_data
  # azurerm_ddos_protection_plan_output = module.azurerm_ddos_protection_plan.azurerm_ddos_protection_plan_output_names
  azurerm_public_ip_prefix_output = module.azurerm_public_ip_prefix.azurerm_public_ip_prefix_output_names
}

module "azurerm_public_ip_prefix" {
  source = "./modules/hashicorp/azurerm/public_ip_prefix"

  azurerm_public_ip_prefix_data   = var.azurerm_public_ip_prefix_data
  azurerm_custom_ip_prefix_output = module.azurerm_custom_ip_prefix.azurerm_custom_ip_prefix_output_names
}

module "azurerm_resource_group" {
  source = "./modules/hashicorp/azurerm/resource_group"

  azurerm_resource_group_data = var.azurerm_resource_group_data
}

module "azurerm_route_table" {
  source = "./modules/hashicorp/azurerm/route_table"

  azurerm_route_table_data = var.azurerm_route_table_data
}

module "azurerm_subnet" {
  source = "./modules/hashicorp/azurerm/subnet"

  azurerm_subnet_data = var.azurerm_subnet_data
  # azurerm_service_endpoint_policy_output = module.azurerm_service_endpoint_policy.azurerm_service_endpoint_policy_output_names
}

module "azurerm_subnet_nat_gateway_association" {
  source = "./modules/hashicorp/azurerm/subnet_nat_gateway_association"

  azurerm_subnet_nat_gateway_association_data = var.azurerm_subnet_nat_gateway_association_data
  azurerm_nat_gateway_output                  = module.azurerm_nat_gateway.azurerm_nat_gateway_output_names
  azurerm_subnet_output                       = module.azurerm_subnet.azurerm_subnet_output_names
}

module "azurerm_subnet_network_security_group_association" {
  source = "./modules/hashicorp/azurerm/subnet_network_security_group_association"

  azurerm_subnet_network_security_group_association_data = var.azurerm_subnet_network_security_group_association_data
  azurerm_network_security_group_output                  = module.azurerm_network_security_group.azurerm_network_security_group_output_names
  azurerm_subnet_output                                  = module.azurerm_subnet.azurerm_subnet_output_names
}

module "azurerm_subnet_route_table_association" {
  source = "./modules/hashicorp/azurerm/subnet_route_table_association"

  azurerm_subnet_route_table_association_data = var.azurerm_subnet_route_table_association_data
  azurerm_route_table_output                  = module.azurerm_route_table.azurerm_route_table_output_names
  azurerm_subnet_output                       = module.azurerm_subnet.azurerm_subnet_output_names
}

module "azurerm_virtual_network" {
  source = "./modules/hashicorp/azurerm/virtual_network"

  azurerm_virtual_network_data = var.azurerm_virtual_network_data
}
