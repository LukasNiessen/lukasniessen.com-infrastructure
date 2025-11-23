variable "bucket_name" {
  description = "Name of the S3 bucket used for static website hosting."
  type        = string
}

variable "force_destroy" {
  description = "Allow Terraform to delete the bucket even if it contains objects."
  type        = bool
  default     = false
}

variable "domain_name" {
  description = "Primary domain served via CloudFront."
  type        = string
}

variable "additional_domain_names" {
  description = "Optional extra domain aliases (e.g., www)."
  type        = list(string)
  default     = []
}

variable "index_document" {
  description = "Default index document for the static website."
  type        = string
  default     = "index.html"
}

variable "error_document" {
  description = "Error document returned when CloudFront receives 4xx errors from S3."
  type        = string
  default     = "404.html"
}

variable "price_class" {
  description = "CloudFront price class to control which edge locations are used."
  type        = string
  default     = "PriceClass_All"
}

variable "enable_versioning" {
  description = "Toggle bucket versioning to retain historical object versions."
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags applied to managed resources."
  type        = map(string)
  default     = {}
}
