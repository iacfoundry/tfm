# -----------------------------------------
# Terraform Module
# Contributor(s): William Robinson
# Updated: March 2026
# Purpose: Terraform Resource Module
# -----------------------------------------
variable "azuread_application_data" {
  type = map(object({
    # Required  
    enabled      = bool
    display_name = string

    # Optional  
    description                    = optional(string)
    device_only_auth_enabled       = optional(bool, false)
    fallback_public_client_enabled = optional(bool, false)
    group_membership_claims        = optional(set(string))
    identifier_uris                = optional(set(string))
    logo_image                     = optional(string)
    marketing_url                  = optional(string)
    notes                          = optional(string)
    oauth2_post_response_required  = optional(bool, false)
    owners                         = optional(set(string))
    prevent_duplicate_names        = optional(bool, false)
    privacy_statement_url          = optional(string)
    service_management_reference   = optional(string)
    sign_in_audience               = optional(string, "AzureADMyOrg")
    support_url                    = optional(string)
    tags                           = optional(set(string))
    template_id                    = optional(string)
    terms_of_service_url           = optional(string)

    # Optional Blocks  
    api = optional(object({
      mapped_claims_enabled          = optional(bool, false)
      requested_access_token_version = optional(number, 1)
      known_client_applications      = optional(set(string))
      oauth2_permission_scope = optional(list(object({
        admin_consent_description  = string
        admin_consent_display_name = string
        enabled                    = optional(bool, true)
        id                         = string
        type                       = optional(string, "User")
        user_consent_description   = optional(string)
        user_consent_display_name  = optional(string)
        value                      = optional(string)
      })))
    }))

    app_role = optional(list(object({
      allowed_member_types = list(string)
      description          = string
      display_name         = string
      enabled              = optional(bool, true)
      id                   = string
      value                = optional(string)
    })))

    feature_tags = optional(object({
      custom_single_sign_on = optional(bool, false)
      enterprise            = optional(bool, false)
      gallery               = optional(bool, false)
      hide                  = optional(bool, false)
    }))

    optional_claims = optional(object({
      access_token = optional(list(object({
        name                  = string
        source                = optional(string)
        essential             = optional(bool)
        additional_properties = optional(list(string))
      })))
      id_token = optional(list(object({
        name                  = string
        source                = optional(string)
        essential             = optional(bool)
        additional_properties = optional(list(string))
      })))
      saml2_token = optional(list(object({
        name                  = string
        source                = optional(string)
        essential             = optional(bool)
        additional_properties = optional(list(string))
      })))
    }))

    password = optional(object({
      display_name = string
      end_date     = optional(string)
      start_date   = optional(string)
    }))

    public_client = optional(object({
      redirect_uris = optional(set(string))
    }))

    required_resource_access = optional(list(object({
      resource_app_id = string
      resource_access = list(object({
        id   = string
        type = string
      }))
    })))

    single_page_application = optional(object({
      redirect_uris = optional(set(string))
    }))

    web = optional(object({
      homepage_url  = optional(string)
      logout_url    = optional(string)
      redirect_uris = optional(set(string))
      implicit_grant = optional(object({
        access_token_issuance_enabled = optional(bool)
        id_token_issuance_enabled     = optional(bool)
      }))
    }))
  }))
  default = {}
}
