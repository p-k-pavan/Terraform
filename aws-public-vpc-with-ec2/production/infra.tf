module "vpc" {
  source      = "../modules/network"
  vpc_cidr    = "10.0.0.0/16"
  vpc_name    = "wanderlust"
  environment = "production"
  azs         = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
  cidr_block  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}