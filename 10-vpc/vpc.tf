module "vpc" {
  # source = "../vpc-module"
  source = "git::https://github.com/dhanushboga/vpc-module.git?ref=main"
  VPC_CIDR = var.VPC_CIDR
  Project_name = var.Project_name
  environment = var.environment
  common_tags = var.common_tags
  vpc_tags = var.vpc_tags
  igw_tags = var.igw_tags
  public_subnet_tags = var.public_subnet_tags
  private_subnet_tags = var.private_subnet_tags
  database_subnet_tags = var.database_subnet_tags
  public_route_tags = var.public_route_tags
  private_route_tags = var.private_route_tags
  database_route_tags = var.database_route_tags
  public_subnet_cidr = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  database_subnet_cidr = var.database_subnet_cidr
  is_peering_required = var.is_peering_required
  vpc_peering_tags = var.vpc_peering_tags
  db_subnet_group_tags = var.db_subnet_group_tags
}
