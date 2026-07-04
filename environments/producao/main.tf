module "foundation" {
  source = "../../modules/foundation"

  project_name       = var.project_name
  environment        = var.environment
  vpc_cidr           = var.vpc_cidr
  availability_zones = var.availability_zones

  public_subnets_cidrs      = var.public_subnets_cidrs
  private_app_subnets_cidrs = var.private_app_subnets_cidrs
  private_db_subnets_cidrs  = var.private_db_subnets_cidrs
}
