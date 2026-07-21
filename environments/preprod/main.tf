module "workspace" {
  source                           = "../../modules/workspace"
  databricks_account_id            = var.databricks_account_id
  region                           = var.region
  tags                             = var.tags
  prefix                           = var.prefix
  cidr_block                       = var.cidr_block
}
