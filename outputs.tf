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
