module "vpc" {
  source = "./modules/network"

  az             = var.az
  vpc_cidr_block = var.vpc_cidr_block

  public_subnet_cidr_block = var.public_subnet_cidr_block
  private_subnets          = var.private_subnets
}

module "web_instance" {
  source = "./modules/instance"

  name      = var.instance_name
  vpc_id    = module.vpc.vpc_id
  subnet_id = module.vpc.public_subnet_id
}
