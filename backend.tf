terraform {
  backend "s3" {
    bucket         = "lukasniessen.com-tf-state"
    key            = "state/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}