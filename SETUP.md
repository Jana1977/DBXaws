# Personal Setup Guide — AWS Databricks Basic Workspace

This guide walks through deploying a Databricks E2 workspace on your **personal AWS account**
using this Terraform configuration (no AWS Network Firewall — simplest/cheapest option).

The module used (`aws-workspace-basic`) is referenced directly from the official
`databricks/terraform-databricks-examples` GitHub repo — only this small wrapper
(variables, tfvars, provider config, outputs) lives in your own repo.

## What gets created
- A VPC + subnets + VPC endpoints (via `terraform-aws-modules/vpc/aws`)
- An S3 bucket used as the Databricks "root" (DBFS) storage
- A cross-account IAM role that lets Databricks manage EC2/etc. in your AWS account
- A Databricks E2 workspace (network config, storage config, credentials, workspace + token)

**Cost note:** VPC/S3/IAM resources here are low/no-cost, but once the workspace is created,
any clusters you run will incur AWS EC2 + Databricks DBU charges. Remember to `terraform destroy`
when you're done experimenting to avoid ongoing charges (see bottom of this doc).

## Prerequisites (one-time, manual)

1. **A Databricks account on AWS** — sign up at https://accounts.cloud.databricks.com if you
   haven't already (this is separate from a "workspace" — it's the account level).
2. **An account-level service principal:**
   - Go to https://accounts.cloud.databricks.com → **User management** → **Service principals**
     → **Add service principal**.
   - Select the new service principal → **Roles** tab → grant **Account Admin**.
   - Select the service principal → **Secrets** tab → **Generate secret**. Save the
     **Client ID** and **Client Secret** immediately (the secret is shown only once).
3. **Your Databricks Account ID** — shown in the top-right corner of the Account Console.
4. **An AWS IAM user with programmatic access** (Access Key ID + Secret Access Key) with
   permissions to create VPC, S3, and IAM resources (e.g. `AdministratorAccess` for a personal
   sandbox account, or a scoped-down policy if you prefer).

## Step-by-step

### 1. Configure secrets via `.env`
```bash
cp .env.example .env
```
Edit `.env` and fill in your real values:
- `TF_VAR_databricks_account_client_id`
- `TF_VAR_databricks_account_client_secret`
- `TF_VAR_databricks_account_id`
- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`

`.env` is already excluded from git via `.gitignore` — it will never be committed.

### 2. Load the environment variables into your shell
```bash
source .env
```
(You'll need to re-run this `source .env` any time you open a new terminal session.)

### 3. Review / adjust non-secret settings
Open `terraform.tfvars` and confirm:
- `region = "us-east-1"` (already set)
- `prefix = "personal"` — change to something unique to you if you'd like
- `cidr_block` — only change if `10.4.0.0/16` conflicts with another VPC in your account

### 4. Initialize Terraform
```bash
terraform init
```

### 5. Preview the plan
```bash
terraform plan
```
Review the resources it intends to create — confirm nothing looks unexpected.

### 6. Apply
```bash
terraform apply
```
Type `yes` when prompted. This takes a few minutes.

### 7. Retrieve your workspace URL
```bash
terraform output databricks_host
```
Open that URL in your browser and log in using your Databricks account credentials, or use:
```bash
terraform output -raw databricks_token
```
to get a token for API/CLI access.

## Tearing down (avoid ongoing charges)
```bash
terraform destroy
```
Type `yes` when prompted. This removes the workspace, VPC, S3 bucket, and IAM role.
