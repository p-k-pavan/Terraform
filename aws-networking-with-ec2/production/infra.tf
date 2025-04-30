module "vpc" {
  source             = "../modules/network"
  vpc_cidr           = "10.0.0.0/16"
  vpc_name           = "wanderlust"
  environment        = "production"
  azs                = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
  public_cidr_block  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_cidr_block = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]
  natgw_id           = module.nat.natgw-id
}

module "nat" {
  source           = "../modules/nat"
  public_subnet_id = module.vpc.private_subnet_id_01
  vpc_name         = module.vpc.vpc_name
}