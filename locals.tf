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

  # Networking
  azs = ["${var.aws_region}a", "${var.aws_region}b"]

  # Production VPC
  prod_vpc_cidr         = "10.0.0.0/16"
  prod_public_subnets   = ["10.0.1.0/24", "10.0.2.0/24"]
  prod_private_subnets  = ["10.0.11.0/24", "10.0.12.0/24"]
  prod_isolated_subnets = ["10.0.21.0/24", "10.0.22.0/24"]

  # Staging VPC
  staging_vpc_cidr         = "10.1.0.0/16"
  staging_public_subnets   = ["10.1.1.0/24", "10.1.2.0/24"]
  staging_private_subnets  = ["10.1.11.0/24", "10.1.12.0/24"]
  staging_isolated_subnets = ["10.1.21.0/24", "10.1.22.0/24"]
}
