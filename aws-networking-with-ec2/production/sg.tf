module "SG" {
  source        = "../modules/SecurityGroup"
  vpc_name      = module.vpc.vpc_name
  vpc_id        = module.vpc.vpc_id
  service_ports = ["80", "443", "22", "25", "587", "465", "6443", "8080", "6379", "9000", "4954", "9090", "3000"]
  environment   = module.vpc.environment
}