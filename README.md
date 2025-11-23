# Infrastructure Repo

Terraform configuration for the lukasniessen.com static website. The stack now follows a simple root/module split so you can reuse the `static_site` module or add more environments later without duplicating resources.

## Layout

- `backend.tf` – Remote state (S3 + DynamoDB lock table).
- `providers.tf` – Provider requirements plus default/alias AWS providers.
- `locals.tf` – Centralized tagging logic.
- `main.tf` – Calls the `static_site` module with opinionated defaults.
- `modules/static_site` – Reusable module that provisions the S3 website bucket, encryption, policy, CloudFront distribution, and ACM certificate.

## Prerequisites

1. Terraform 1.6+ installed.
2. AWS credentials with permissions for S3, CloudFront, ACM, and Route53 (for DNS validation of the certificate).
3. The backend bucket/table from `backend.tf` already created (one-time bootstrap).

## Usage

```powershell
# Initialize providers and backend
terraform init

# Review changes
terraform plan -var "domain_name=lukasniessen.com"

# Apply once happy
terraform apply
```

### Key Variables

- `website_bucket_name` – S3 bucket hosting static assets.
- `domain_name` / `alternative_domain_names` – Domains on the CloudFront distribution & ACM cert.
- `enable_bucket_versioning` – Keep previous file versions for quick rollback.
- `price_class` – Control CloudFront edge coverage/cost.
- `custom_tags` – Extra tags merged with the defaults defined in `locals.tf`.

See `variables.tf` for the full list along with helpful defaults so you can get started quickly.