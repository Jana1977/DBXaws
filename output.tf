output "databricks_host" {
  description = "URL of the created Databricks workspace"
  value       = module.aws-workspace-basic.databricks_host
}

output "databricks_token" {
  description = "Personal access token generated for the workspace (sensitive)"
  value       = module.aws-workspace-basic.databricks_token
  sensitive   = true
}

output "workspace_id" {
  description = "ID of the created Databricks workspace"
  value       = module.aws-workspace-basic.workspace_id
}
