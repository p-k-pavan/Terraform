provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
    bucket = "pkpavanbucketno01"
    key    = "production-modules.tfstate"
    region = "ap-south-1"
  }
}