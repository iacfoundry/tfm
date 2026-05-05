
### GROUP_MEMBER MODULE
## Updated 05/30/2024 13:53:29

# GROUP_MEMBER_DATA.TFVARS EXAMPLE
```
group_member_data = {
  "example_group_member_1" = {
    enabled                      = true
    group_object_id              = "00000000-0000-0000-0000-000000000000"
    member_object_id             = "11111111-1111-1111-1111-111111111111"
  }
  "example_group_member_2" = {
    enabled                      = true
    group_name                   = "example-group"
    member_user_name                    = "example-user"
  }
  "example_group_member_3" = {
    enabled                      = true
    group_name                   = "example-group"
    member_service_principal_name = "example-application"
  }
}
```

# GROUP_MEMBER MAIN.TF MODULE REFERENCE
```
module "group_member" {
        source = "./modules/azuread/group_member"

        group_member_data = var.group_member_data
}
```

# GROUP_MEMBER ROOT VARIABLES.TF
```
variable "group_member_data" {
  type = map(object({
    enabled                              = bool
    group_object_id                      = optional(string)
    group_name                           = optional(string)
    member_object_id                     = optional(string)
    member_group_name                    = optional(string)
    member_user_name                     = optional(string)
    member_service_principal_name        = optional(string)
  }))
  default = {}
}
```
