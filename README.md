# Databricks AWS Account-Level Workspace (Personal Setup)

Terraform configuration to provision a Databricks E2 workspace on AWS, using the
`aws-workspace-basic` module from
[databricks/terraform-databricks-examples](https://github.com/databricks/terraform-databricks-examples).

No AWS Network Firewall is included — this is the simplest/cheapest deployment option,
suitable for personal experimentation.

See [SETUP.md](SETUP.md) for full step-by-step setup instructions.

## Quick start
```bash
cp .env.example .env       # fill in your real secrets
source .env
terraform init
terraform plan
terraform apply
```

## Files
| File | Purpose |
|---|---|
| `main.tf` | Calls the `aws-workspace-basic` module from GitHub |
| `variables.tf` | Input variable declarations |
| `terraform.tfvars` | Non-secret variable values (region, prefix, tags) |
| `versions.tf` | Provider requirements + AWS/Databricks provider config |
| `output.tf` | Exposes workspace URL, token, and workspace ID |
| `.env.example` | Template for secrets (copy to `.env`, never commit `.env`) |
| `SETUP.md` | Full step-by-step setup guide |
