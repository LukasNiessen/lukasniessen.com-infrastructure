output "bucket_name" {
  description = "Name of the S3 bucket hosting the static website."
  value       = aws_s3_bucket.this.bucket
}

output "bucket_website_endpoint" {
  description = "S3 website endpoint backing CloudFront."
  value       = aws_s3_bucket_website_configuration.this.website_endpoint
}

output "cloudfront_distribution_id" {
  description = "Identifier of the CloudFront distribution."
  value       = aws_cloudfront_distribution.this.id
}

output "cloudfront_domain_name" {
  description = "Domain name assigned to the CloudFront distribution."
  value       = aws_cloudfront_distribution.this.domain_name
}

output "certificate_arn" {
  description = "ARN of the ACM certificate used by CloudFront."
  value       = aws_acm_certificate.this.arn
}
