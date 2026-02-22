variable "aws_region" {
  description = "Primary AWS region for infrastructure resources."
  type        = string
  default     = "us-east-1"
}

variable "acm_certificate_region" {
  description = "Region where the ACM certificate for CloudFront is requested (must stay us-east-1)."
  type        = string
  default     = "us-east-1"

  validation {
    condition     = var.acm_certificate_region == "us-east-1"
    error_message = "CloudFront only supports certificates in us-east-1."
  }
}

variable "project_name" {
  description = "Used for tagging and naming."
  type        = string
  default     = "lukasniessen.com"
}

variable "environment" {
  description = "Deployment environment identifier (e.g., production, staging)."
  type        = string
  default     = "production"
}

variable "custom_tags" {
  description = "Optional additional tags merged into the default tag set."
  type        = map(string)
  default     = {}
}

variable "website_bucket_name" {
  description = "Name of the S3 bucket used for static website hosting."
  type        = string
  default     = "www.lukasniessen.com"
}

variable "force_destroy_bucket" {
  description = "Set to true to allow Terraform to destroy the S3 bucket even when it contains objects."
  type        = bool
  default     = false
}

variable "domain_name" {
  description = "Primary domain served via CloudFront."
  type        = string
  default     = "lukasniessen.com"
}

variable "alternative_domain_names" {
  description = "Additional domain aliases (e.g., www)."
  type        = list(string)
  default     = ["www.lukasniessen.com"]
}

variable "website_index_document" {
  description = "Default index document for the static website."
  type        = string
  default     = "index.html"
}

variable "website_error_document" {
  description = "Error document returned by the static website."
  type        = string
  default     = "404.html"
}

variable "enable_bucket_versioning" {
  description = "Enable versioning on the website bucket to keep historical copies of objects."
  type        = bool
  default     = false
}

variable "price_class" {
  description = "CloudFront price class controlling the edge locations used."
  type        = string
  default     = "PriceClass_All"
}

variable "staging_bucket_name" {
  description = "Name of the S3 bucket for the staging website."
  type        = string
  default     = "stage.lukasniessen.com"
}

variable "staging_domain_name" {
  description = "Domain for the staging environment."
  type        = string
  default     = "stage.lukasniessen.com"
}

variable "staging_price_class" {
  description = "CloudFront price class for the staging distribution."
  type        = string
  default     = "PriceClass_100"
}

# =============================================================================
# ECS Fargate
# =============================================================================

variable "ecs_container_image" {
  description = "Docker image for the ECS tasks."
  type        = string
  default     = "nginx:latest"
}

variable "ecs_container_port" {
  description = "Port the container listens on."
  type        = number
  default     = 8080
}

variable "ecs_cpu" {
  description = "CPU units for ECS tasks (1024 = 1 vCPU)."
  type        = number
  default     = 256
}

variable "ecs_memory" {
  description = "Memory in MiB for ECS tasks."
  type        = number
  default     = 512
}

variable "prod_ecs_desired_count" {
  description = "Number of ECS tasks for production."
  type        = number
  default     = 2
}

variable "staging_ecs_desired_count" {
  description = "Number of ECS tasks for staging."
  type        = number
  default     = 1
}

# =============================================================================
# RDS PostgreSQL
# =============================================================================

variable "prod_rds_instance_class" {
  description = "RDS instance class for production."
  type        = string
  default     = "db.t4g.micro"
}

variable "staging_rds_instance_class" {
  description = "RDS instance class for staging."
  type        = string
  default     = "db.t4g.micro"
}

variable "rds_allocated_storage" {
  description = "Allocated storage in GiB for RDS instances."
  type        = number
  default     = 20
}

variable "rds_engine_version" {
  description = "PostgreSQL engine version."
  type        = string
  default     = "16.4"
}

variable "prod_rds_multi_az" {
  description = "Enable Multi-AZ for production RDS."
  type        = bool
  default     = false
}

variable "prod_rds_deletion_protection" {
  description = "Enable deletion protection for production RDS."
  type        = bool
  default     = true
}