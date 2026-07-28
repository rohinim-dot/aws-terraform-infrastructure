locals {
  project_name = "secure-web-platform"
  environment  = "dev"

  name_prefix = "${local.project_name}-${local.environment}"

  common_tags = {
    Project     = local.project_name
    Environment = local.environment
    ManagedBy   = "Terraform"
    Repository  = "terraform-aws-secure-web-platform"
  }
}
