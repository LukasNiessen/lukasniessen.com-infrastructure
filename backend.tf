terraform {
  backend "s3" {
    bucket         = "lukasniessen.com-tf-state"
    key            = "state/terraform.tfstate"
    region         = "us-east-1"
    use_lockfile   = true
    encrypt        = true
  }
}