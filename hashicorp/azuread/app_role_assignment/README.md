
### APP_ROLE_ASSIGNMENT MODULE
## Updated 05/31/2024 09:51:19

# APP_ROLE_ASSIGNMENT_DATA.TFVARS EXAMPLE
```
app_role_assignment_data = {
  "assignment_1" = {
    enabled             = true
    app_role_id         = "role-id-1"
    principal_object_id = "principal-id-1"
    resource_object_id  = "resource-id-1"
  },
  "assignment_2" = {
    enabled             = true
    app_role_id         = "role-id-2"
    principal_object_id = "principal-id-2"
    resource_object_id  = "resource-id-2"
  }
}
```

# APP_ROLE_ASSIGNMENT MAIN.TF MODULE REFERENCE
```
module "app_role_assignment" {
        source = "./modules/hashicorp/azuread/app_role_assignment"

        app_role_assignment_data = var.app_role_assignment_data
}
```

# APP_ROLE_ASSIGNMENT ROOT VARIABLES.TF
```
variable "app_role_assignment_data" {
  type = map(object({
    # Required
    enabled            = bool
    app_role_id        = string
    principal_object_id = string
    resource_object_id = string
  }))
  default = {}
}
```
