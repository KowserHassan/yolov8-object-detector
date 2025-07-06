module "vpc" {
  source              = "./modules/vpc"
  vpc_name            = var.vpc_name
  vpc_cidr_block      = var.vpc_cidr_block
  public_subnet_cidrs = var.public_subnet_cidrs
  availability_zones  = var.availability_zones
  environment         = var.environment
  project_name        = var.project_name
}

module "security_groups" {
  source  = "./modules/security-groups"
  vpc_id  = module.vpc.vpc_id
  sg_name = var.sg_name
}

module "acm" {
  source      = "./modules/acm"
  domain_name = "ai.dojo.kowser.co.uk"
  zone_id     = var.zone_id
}

module "alb" {
  source            = "./modules/alb"
  alb_name          = var.alb_name
  target_group_name = var.target_group_name
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  security_groups   = module.security_groups.security_group_ids
  certificate_arn   = module.acm.certificate_arn
  environment       = var.environment
  project_name      = var.project_name
  health_check_path = var.health_check_path
}

module "ecs" {
  source             = "./modules/ecs"
  cluster_name       = var.ecs_cluster_name
  container_image    = var.container_image
  container_name     = var.container_name
  container_port     = var.container_port
  task_cpu           = var.task_cpu
  task_memory        = var.task_memory
  task_family        = var.task_family
  desired_count      = var.desired_count
  service_name       = var.service_name
  http_listener_arn  = module.alb.http_listener_arn
  https_listener_arn = module.alb.https_listener_arn
  subnet_ids         = module.vpc.public_subnet_ids
  security_group_ids = module.security_groups.security_group_ids
  target_group_arn   = module.alb.target_group_arn
  environment        = var.environment
  project_name       = var.project_name

  depends_on = [module.alb]
}

module "route53" {
  source       = "./modules/route53"
  domain_name  = var.domain_name
  subdomain    = var.subdomain
  alb_dns_name = module.alb.alb_dns_name
  environment  = var.environment
  zone_id = var.zone_id
  alb_zone_id   = module.alb.zone_id
}

module "iam" {
  source        = "./modules/iam"
  iam_role_name = "ecs_task_execution_role"
}




