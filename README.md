# tf-azurerm-module_primitive-data_protection_backup_policy_blob_storage
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>3.117 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.117.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_data_protection_backup_policy_blob_storage.policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_protection_backup_policy_blob_storage) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_policy_name"></a> [policy\_name](#input\_policy\_name) | n/a | `string` | n/a | yes |
| <a name="input_vault_id"></a> [vault\_id](#input\_vault\_id) | n/a | `string` | n/a | yes |
| <a name="input_backup_repeating_time_intervals"></a> [backup\_repeating\_time\_intervals](#input\_backup\_repeating\_time\_intervals) | n/a | `list(string)` | `null` | no |
| <a name="input_operational_default_retention_duration"></a> [operational\_default\_retention\_duration](#input\_operational\_default\_retention\_duration) | n/a | `string` | `null` | no |
| <a name="input_vault_default_retention_duration"></a> [vault\_default\_retention\_duration](#input\_vault\_default\_retention\_duration) | n/a | `string` | `null` | no |
| <a name="input_time_zone"></a> [time\_zone](#input\_time\_zone) | n/a | `string` | `null` | no |
| <a name="input_retention_rules"></a> [retention\_rules](#input\_retention\_rules) | n/a | <pre>list(object({<br/>    name     = string<br/>    priority = number<br/><br/>    life_cycle = object({<br/>      data_store_type = string<br/>      duration        = string<br/>    })<br/><br/>    criteria = object({<br/>      absolute_criteria      = optional(string)<br/>      days_of_month          = optional(list(number))<br/>      days_of_week           = optional(list(string))<br/>      months_of_year         = optional(list(string))<br/>      scheduled_backup_times = optional(list(string))<br/>      weeks_of_month         = optional(list(string))<br/>    })<br/>  }))</pre> | `[]` | no |
| <a name="input_timeouts"></a> [timeouts](#input\_timeouts) | n/a | <pre>object({<br/>    create = optional(string, "30m")<br/>    read   = optional(string, "5m")<br/>    delete = optional(string, "30m")<br/>  })</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
<!-- END_TF_DOCS -->
