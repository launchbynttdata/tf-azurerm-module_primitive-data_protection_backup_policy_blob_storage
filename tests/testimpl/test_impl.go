package testimpl

import (
	"context"
	"os"
	"testing"

	"github.com/Azure/azure-sdk-for-go/sdk/azidentity"
	"github.com/Azure/azure-sdk-for-go/sdk/resourcemanager/dataprotection/armdataprotection"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/launchbynttdata/lcaf-component-terratest/types"
	"github.com/stretchr/testify/assert"
)

func TestBackupPolicyBlobStorage(t *testing.T, ctx types.TestContext) {

	subscriptionId := os.Getenv("ARM_SUBSCRIPTION_ID")

	if subscriptionId == "" {
		t.Fatal("ARM_SUBSCRIPTION_ID environment variable is not set")
	}

	cred, err := azidentity.NewDefaultAzureCredential(nil)

	if err != nil {
		t.Fatalf("Unable to get Azure credentials: %v", err)
	}

	t.Run("validateBackupPolicyExists", func(t *testing.T) {

		resourceGroupName := terraform.Output(
			t,
			ctx.TerratestTerraformOptions(),
			"resource_group_name",
		)

		vaultName := terraform.Output(
			t,
			ctx.TerratestTerraformOptions(),
			"backup_vault_name",
		)

		policyName := terraform.Output(
			t,
			ctx.TerratestTerraformOptions(),
			"backup_policy_name",
		)

		client, err := armdataprotection.NewBackupPoliciesClient(
			subscriptionId,
			cred,
			nil,
		)

		if err != nil {
			t.Fatalf("Failed to create BackupPolicies client: %v", err)
		}

		policy, err := client.Get(
			context.Background(),
			resourceGroupName,
			vaultName,
			policyName,
			nil,
		)

		assert.NoError(t, err)

		assert.Equal(
			t,
			policyName,
			*policy.Name,
			"Backup policy name mismatch",
		)
	})
}
