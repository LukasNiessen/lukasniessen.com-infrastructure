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
