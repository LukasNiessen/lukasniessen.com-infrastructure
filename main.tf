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
  tags                    = local.default_tags
}
