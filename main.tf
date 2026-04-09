module "static_site" {
  source = "./modules/static_site"

  bucket_name             = var.website_bucket_name
  force_destroy           = var.force_destroy_bucket
  domain_name             = var.domain_name
  additional_domain_names = var.alternative_domain_names
  index_document          = var.website_index_document
  error_document          = var.website_error_document
  price_class             = var.price_class
  enable_versioning       = var.enable_bucket_versioning
  # S3-only website mode: no /api/* ALB origin
  api_alb_dns_name        = ""
  tags                    = local.default_tags
}

module "staging_site" {
  source = "./modules/static_site"

  bucket_name             = var.staging_bucket_name
  force_destroy           = var.force_destroy_bucket
  domain_name             = var.staging_domain_name
  additional_domain_names = []
  index_document          = var.website_index_document
  error_document          = var.website_error_document
  price_class             = var.staging_price_class
  enable_versioning       = var.enable_bucket_versioning
  # S3-only website mode: no /api/* ALB origin
  api_alb_dns_name        = ""
  tags                    = local.staging_tags
}

# =============================================================================
# Production — VPC / ECS / RDS
# =============================================================================

# module "prod_vpc" {
#   source = "./modules/vpc"

#   name                  = "${var.project_name}-prod"
#   cidr_block            = local.prod_vpc_cidr
#   azs                   = local.azs
#   public_subnet_cidrs   = local.prod_public_subnets
#   private_subnet_cidrs  = local.prod_private_subnets
#   isolated_subnet_cidrs = local.prod_isolated_subnets
#   tags                  = local.default_tags
# }

# module "prod_ecs" {
#   source = "./modules/ecs_fargate"

#   name               = "${var.project_name}-prod"
#   vpc_id             = module.prod_vpc.vpc_id
#   public_subnet_ids  = module.prod_vpc.public_subnet_ids
#   private_subnet_ids = module.prod_vpc.private_subnet_ids
#   container_image    = var.ecs_container_image
#   container_port     = var.ecs_container_port
#   cpu                = var.ecs_cpu
#   memory             = var.ecs_memory
#   desired_count      = var.prod_ecs_desired_count
#   tags               = local.default_tags
# }

# module "prod_rds" {
#   source = "./modules/rds_postgres"

#   name                       = "${var.project_name}-prod"
#   vpc_id                     = module.prod_vpc.vpc_id
#   subnet_ids                 = module.prod_vpc.isolated_subnet_ids
#   allowed_security_group_ids = [module.prod_ecs.ecs_security_group_id]
#   instance_class             = var.prod_rds_instance_class
#   allocated_storage          = var.rds_allocated_storage
#   engine_version             = var.rds_engine_version
#   multi_az                   = var.prod_rds_multi_az
#   deletion_protection        = var.prod_rds_deletion_protection
#   skip_final_snapshot        = false
#   tags                       = local.default_tags
# }

# =============================================================================
# Staging — VPC / ECS / RDS
# =============================================================================

# module "staging_vpc" {
#   source = "./modules/vpc"

#   name                  = "${var.project_name}-staging"
#   cidr_block            = local.staging_vpc_cidr
#   azs                   = local.azs
#   public_subnet_cidrs   = local.staging_public_subnets
#   private_subnet_cidrs  = local.staging_private_subnets
#   isolated_subnet_cidrs = local.staging_isolated_subnets
#   tags                  = local.staging_tags
# }

# module "staging_ecs" {
#   source = "./modules/ecs_fargate"

#   name               = "${var.project_name}-staging"
#   vpc_id             = module.staging_vpc.vpc_id
#   public_subnet_ids  = module.staging_vpc.public_subnet_ids
#   private_subnet_ids = module.staging_vpc.private_subnet_ids
#   container_image    = var.ecs_container_image
#   container_port     = var.ecs_container_port
#   cpu                = var.ecs_cpu
#   memory             = var.ecs_memory
#   desired_count      = var.staging_ecs_desired_count
#   tags               = local.staging_tags
# }

# module "staging_rds" {
#   source = "./modules/rds_postgres"

#   name                       = "${var.project_name}-staging"
#   vpc_id                     = module.staging_vpc.vpc_id
#   subnet_ids                 = module.staging_vpc.isolated_subnet_ids
#   allowed_security_group_ids = [module.staging_ecs.ecs_security_group_id]
#   instance_class             = var.staging_rds_instance_class
#   allocated_storage          = var.rds_allocated_storage
#   engine_version             = var.rds_engine_version
#   multi_az                   = false
#   deletion_protection        = false
#   skip_final_snapshot        = true
#   tags                       = local.staging_tags
# }
