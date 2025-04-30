module "Server" {
  source        = "../modules/compute"
  ami           = "ami-0e35ddab05955cf57"
  instance_type = "t2.large"
  key_name      = "key"
  subnet_id     = module.vpc.subnet_id_01
  sg-id         = module.SG.sg-id
  vpc_name      = module.vpc.vpc_name
  environment   = module.vpc.environment
}
