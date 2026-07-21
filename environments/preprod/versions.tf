# versions.tf (preprod)
terraform {
  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = ">=1.13.0"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "dbx-tfstate-457961354417"
    key            = "preprod/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "dbx-tfstate-lock"
    encrypt        = true
  }
}

provider "aws" {
  region = var.region
}

provider "databricks" {
  host          = "https://accounts.cloud.databricks.com"
  account_id    = var.databricks_account_id
  client_id     = var.databricks_account_client_id
  client_secret = var.databricks_account_client_secret
}
