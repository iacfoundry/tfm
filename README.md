# Low-Code Module Mono-Repo

## ◼ Overview
This repository serves as the central library for our **Low-Code Terraform** initiative. It houses **Stateless Universal Modules** that are designed to be consumed strictly through data (`tfvars`), eliminating the need for engineers to write complex Terraform logic.

**Current Status:** *Semi-Automated / Manual Generation*
While we transition to full automation, the modules in this repository are **manually generated and verified**. They are designed to provide full **Provider Documentation Parity** (exposing all arguments) but are updated on a periodic basis rather than dynamically streamed.

---

## ◼ The "Low-Code Terraform" Philosophy
In this framework, Terraform is treated as an execution engine, not a programming surface.
*   **No Resource Blocks:** Consumers do not need to write `resource "azurerm_..."` blocks to consume these modules.
*   **No Module Blocks:** Consumers do not need to write `module "resource_..."` blocks to consume these modules.
*   **No Logic:** Modules contain all logic and no `locals`, conditionals, or complex functions are needed in each repo.
*   **Data Driven:** Infrastructure is defined entirely in `*.tfvars` files.

---

## ◼ Repository Structure
This Mono-Repo is organized to support a simplified, version-agnostic structure. We rely on git tags for versioning the repository itself, rather than nesting versions in folders.

**Path Schema:** `modules/{developer}/{provider}/{resource}`
The file structure all the way down to the files are explicit with the name of the resource.

```text
/hashicorp                              <-- Developer (Namespace)
  /azurerm                              <-- Provider
    /azurerm_resource_group
        ├── README.md                     <-- Readme details for each resource module
        ├── resource_group.outputs.tf     <-- Outputs used by other resource modules in the same pipeline
        ├── resource_group.resource.tf    <-- Stateless, manual update
        └── resource_group.variables.tf   <-- Uses optional() for 100% coverage
    /azurerm_storage_account
        ├── README.md
        ├── storage_account.outputs.tf
        ├── storage_account.resource.tf
        └── storage_account.variables.tf
/internal                                 <-- Custom/Private Namespace
  /imperva                                <-- Consolidated Modules (Wrappers)
```

---

## ◼ How to Use: The "Tfvars-Only" Workflow

You do not need to clone this repo or write `module` blocks in your application code. The **GitHub Actions** handle the complexity.

### 1. Define Intent (The User's Job)
In your application repository, you only create **Variable Files**. To follow the explicit naming the file name dictates the resource type.

**Example: `resource_group_data.tfvars`**
```hcl
azurerm_resource_group_data = {       <-- This is the variable that is automatically defined by the resource modules.
  rg-prod-001 = {                     <-- This key needs to be unique.
    enabled  = true                   <-- This determines if the resource will be built or not.  If set to false after true, this will destroy the resource without removing the data entry.
    location = "eastus"               <-- Depending on the defaults, this may not be needed.
    name     = "rg-production-001"
    ...
  }
}
```
*   **Simplicity:** You only define the data you need.
*   **Flexibility:** Because the underlying module uses `optional()` types, you can add any argument supported by the provider without changing the module code.
*   **Organization:** `{project_name}/{grouped_resources}/`
The file structure all the way down to the files are explicit with the name of the resource.
```text
/pca                                    <-- Project Name
  /api_management                       <-- Grouped Resources
    ├── api_management_data.tfvars
    ├── resource_group_data.tfvars
    └── virtual_network_data.tfvars 
```

### 2. The Pipeline (The Automation's Job)
When your pipeline runs, the Actions perform the heavy lifting:

1.  **Merge Data:** The **Terraform Merge TFVars Action** scans your repo recursively. It allows you to split configuration into logical files as shown above and merges them into a single plan file.

2.  **Fetch Modules:** The **Terraform Modules Download Action** connects to this Mono-Repo.
    *   It identifies which resources you are using.
    *   It performs a **Sparse Checkout**, downloading *only* the specific folders needed (Defaults to  `hashicorp/**, internal/**`) to your runner.

3.  **Execute:** Terraform runs `plan` and `apply` using the merged data and downloaded modules.

---

## ◼ Module Maintenance (Administrator Guide)

*This section is for contributors maintaining the modules.*

Module updates follow a **Low-Code Maintenance Process**:

1.  **Generation:** Modules are generated locally.  Manually parsed from provider documentation to ensure 100% argument coverage or use automation with future tools like IAC Foundry.
2.  **Statelessness:** Ensure `{resource}.variables.tf` uses `map(object({...}))` with `optional` flags. Do not introduce "opinionated" defaults in the module source unless needed for security.
3.  **Updates:** When a provider updates (e.g., Azure adds a new field to Storage Accounts), a maintainer must update the `{resource}.variables.tf` and `{resource}.resource.tf` in this repo and push the change.
4.  **Consolidated Modules:** For complex patterns (e.g., a "VM Base Build" that combines a NIC, Disk, and VM), create a wrapper in `modules/internal/`. These should call the base modules as sub-modules.