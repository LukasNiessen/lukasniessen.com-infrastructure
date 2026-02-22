output "website_bucket_name" {
  description = "Name of the S3 bucket hosting the site."
  value       = module.static_site.bucket_name
}

output "cloudfront_distribution_id" {
  description = "Identifier of the CloudFront distribution fronting the site."
  value       = module.static_site.cloudfront_distribution_id
}

output "cloudfront_domain_name" {
  description = "CloudFront domain name you can CNAME to."
  value       = module.static_site.cloudfront_domain_name
}

output "certificate_arn" {
  description = "ARN of the ACM certificate issued for the domain."
  value       = module.static_site.certificate_arn
}

output "staging_bucket_name" {
  description = "Name of the S3 bucket hosting the staging site."
  value       = module.staging_site.bucket_name
}

output "staging_cloudfront_distribution_id" {
  description = "Identifier of the staging CloudFront distribution."
  value       = module.staging_site.cloudfront_distribution_id
}

output "staging_cloudfront_domain_name" {
  description = "Staging CloudFront domain name — point stage.lukasniessen.com to this in Squarespace DNS."
  value       = module.staging_site.cloudfront_domain_name
}

output "staging_certificate_arn" {
  description = "ARN of the ACM certificate for staging."
  value       = module.staging_site.certificate_arn
}

output "staging_certificate_validation_records" {
  description = "DNS CNAME records to add in Squarespace for staging certificate validation."
  value       = module.staging_site.certificate_validation_records
}

# =============================================================================
# VPC
# =============================================================================

output "prod_vpc_id" {
  description = "ID of the production VPC."
  value       = module.prod_vpc.vpc_id
}

output "staging_vpc_id" {
  description = "ID of the staging VPC."
  value       = module.staging_vpc.vpc_id
}

# =============================================================================
# ECS Fargate
# =============================================================================

output "prod_alb_dns_name" {
  description = "DNS name of the production ALB."
  value       = module.prod_ecs.alb_dns_name
}

output "prod_ecs_cluster_arn" {
  description = "ARN of the production ECS cluster."
  value       = module.prod_ecs.cluster_arn
}

output "staging_alb_dns_name" {
  description = "DNS name of the staging ALB."
  value       = module.staging_ecs.alb_dns_name
}

output "staging_ecs_cluster_arn" {
  description = "ARN of the staging ECS cluster."
  value       = module.staging_ecs.cluster_arn
}

# =============================================================================
# RDS PostgreSQL
# =============================================================================

output "prod_rds_endpoint" {
  description = "Connection endpoint for the production RDS instance."
  value       = module.prod_rds.endpoint
}

output "prod_rds_master_user_secret_arn" {
  description = "ARN of the Secrets Manager secret for the production RDS master password."
  value       = module.prod_rds.master_user_secret_arn
}

output "staging_rds_endpoint" {
  description = "Connection endpoint for the staging RDS instance."
  value       = module.staging_rds.endpoint
}

output "staging_rds_master_user_secret_arn" {
  description = "ARN of the Secrets Manager secret for the staging RDS master password."
  value       = module.staging_rds.master_user_secret_arn
}
