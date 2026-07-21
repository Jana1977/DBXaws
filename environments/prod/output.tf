output "databricks_host" {
  description = "URL of the created Databricks workspace"
  value       = module.workspace.databricks_host
}

output "databricks_token" {
  description = "Personal access token generated for the workspace (sensitive)"
  value       = module.workspace.databricks_token
  sensitive   = true
}

output "workspace_id" {
  description = "ID of the created Databricks workspace"
  value       = module.workspace.workspace_id
}
