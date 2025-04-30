module "Public-Server" {
  source            = "../modules/compute"
  ami               = "ami-0e35ddab05955cf57"
  instance_type     = "t2.large"
  key_name          = "key"
  public_subnet_id  = module.vpc.public_subnet_id_01
  private_subnet_id = module.vpc.private_subnet_id_01
  sg-id             = module.SG.sg-id
  vpc_name          = module.vpc.vpc_name
  environment       = module.vpc.environment
}



