# Non-secret configuration values for the PROD environment.
# Secrets (Databricks account ID/client id/secret, AWS keys) are supplied via
# the .env file (see .env.example) and picked up as TF_VAR_* / AWS_* env vars,
# or via GitHub Secrets/Environments in CI.

region = "us-east-1"
prefix = "prod-dbx"

# Leave as default unless it overlaps with an existing VPC in your AWS account.
# cidr_block = "10.4.0.0/16"

tags = {
  Environment    = "prod"
  ManagedBy      = "terraform"
  CallingDBXAcct = "admin@datajilla"
  CalledAWSAcct  = "datajilla@gmail.com"
}
