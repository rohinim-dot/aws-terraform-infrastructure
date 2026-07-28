output "aws_region" {
  description = "AWS Region selected for this deployment."
  value       = var.aws_region
}

output "project_name" {
  description = "Name of the project."
  value       = local.project_name
}

output "environment" {
  description = "Deployment environment."
  value       = local.environment
}

output "name_prefix" {
  description = "Standard naming prefix used for AWS resources."
  value       = local.name_prefix
}
