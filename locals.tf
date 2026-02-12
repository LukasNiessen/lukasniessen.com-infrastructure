locals {
  default_tags = merge(
    {
      Project     = var.project_name
      Environment = var.environment
      ManagedBy   = "Terraform"
    },
    var.custom_tags,
  )

  staging_tags = merge(
    {
      Project     = var.project_name
      Environment = "staging"
      ManagedBy   = "Terraform"
    },
    var.custom_tags,
  )
}
