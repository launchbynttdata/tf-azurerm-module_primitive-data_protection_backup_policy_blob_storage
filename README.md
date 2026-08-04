# tf-azurerm-module_primitive-data_protection_backup_policy_blob_storage

## Overview

This Terraform module creates an Azure Data Protection backup policy for Blob Storage with configurable schedules and retention rules.

## Usage

See [examples/complete](examples/complete) for a deployable example.

## Module Development

### Pre-Requisites

The following commands should be available on your system:

- `asdf` or `mise`
- `make`
- `python3` (for pre-commit)

Additionally, your `git` user and email must be configured. Run `make configure` from the repository root to confirm that these requirements are met.

### Pre-Commit hooks

The [.pre-commit-config.yaml](.pre-commit-config.yaml) file defines hooks for Terraform formatting, validation, documentation generation, and secret detection. Hooks are installed by `make configure`. Go linting runs through `make lint` locally and in CI.

### Terratest examples

Tests in `tests/post_deploy_functional/` and `tests/post_deploy_functional_readonly/` explicitly target `examples/complete`. The functional suite uses the apply/test/destroy runner; the readonly suite uses the non-destructive runner against existing infrastructure.

### Local Validation

Before pushing changes:

1. Run `make configure` successfully.
2. Sign in to Azure and select the appropriate subscription.
3. Run the linters:

```shell
make lint
```

4. When Azure credentials are available, run the integration tests (apply, test, and destroy):

```shell
make test
```

Pre-commit validation, linting, and tests also run in CI.

### Review & Merge Process

Open a pull request to `main`. The PR title must follow [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/#specification) format to merge and drive semantic versioning. Ensure CI passes, address review feedback, and obtain the approvals required by `CODEOWNERS`.

### Automatic Updates

Shared configuration and workflows are managed through [launch-terraform-skeleton](https://github.com/launchbynttdata/launch-terraform-skeleton). Avoid one-off edits to generated skeleton files unless necessary. Use `copier check-update` and `copier update` when refreshing from the skeleton.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.3 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>3.117 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_data_protection_backup_policy_blob_storage.policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_protection_backup_policy_blob_storage) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_backup_repeating_time_intervals"></a> [backup\_repeating\_time\_intervals](#input\_backup\_repeating\_time\_intervals) | Repeating time intervals that define the backup schedule. | `list(string)` | `null` | no |
| <a name="input_operational_default_retention_duration"></a> [operational\_default\_retention\_duration](#input\_operational\_default\_retention\_duration) | Default retention duration for backups in the operational store. | `string` | `null` | no |
| <a name="input_policy_name"></a> [policy\_name](#input\_policy\_name) | Name of the Blob Storage backup policy. | `string` | n/a | yes |
| <a name="input_retention_rules"></a> [retention\_rules](#input\_retention\_rules) | Retention rules that define how backup instances are retained. | <pre>list(object({<br/>    name     = string<br/>    priority = number<br/><br/>    life_cycle = object({<br/>      data_store_type = string<br/>      duration        = string<br/>    })<br/><br/>    criteria = object({<br/>      absolute_criteria      = optional(string)<br/>      days_of_month          = optional(list(number))<br/>      days_of_week           = optional(list(string))<br/>      months_of_year         = optional(list(string))<br/>      scheduled_backup_times = optional(list(string))<br/>      weeks_of_month         = optional(list(string))<br/>    })<br/>  }))</pre> | `[]` | no |
| <a name="input_time_zone"></a> [time\_zone](#input\_time\_zone) | Time zone used by the backup schedule. | `string` | `null` | no |
| <a name="input_timeouts"></a> [timeouts](#input\_timeouts) | Timeouts for creating, reading, and deleting the backup policy. | <pre>object({<br/>    create = optional(string, "30m")<br/>    read   = optional(string, "5m")<br/>    delete = optional(string, "30m")<br/>  })</pre> | `{}` | no |
| <a name="input_vault_default_retention_duration"></a> [vault\_default\_retention\_duration](#input\_vault\_default\_retention\_duration) | Default retention duration for backups in the vault store. | `string` | `null` | no |
| <a name="input_vault_id"></a> [vault\_id](#input\_vault\_id) | Resource ID of the Data Protection backup vault. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Resource ID of the Blob Storage backup policy. |
| <a name="output_name"></a> [name](#output\_name) | Name of the Blob Storage backup policy. |
<!-- END_TF_DOCS -->
