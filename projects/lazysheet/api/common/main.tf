module "variables" {
  source = "../variables"

  environment        = var.environment
  domain_prefix     = var.domain_prefix
  subnet_id         = var.subnet_id
  security_group_ids = var.security_group_ids
  key_name          = var.key_name
  app_port          = var.app_port
  db_host           = var.db_host
  db_port           = var.db_port
  db_username       = var.db_username
  db_password       = var.db_password
  db_database       = var.db_database
}

locals {
  common_config = {
    project_name = "lazysheet"
    base_domain  = "lazysheet.com"
  }

  common_tags = {
    Project     = local.common_config.project_name
    ManagedBy   = "terraform"
    Environment = module.variables.environment
  }

  domain = module.variables.domain_prefix == "" ? "api.${local.common_config.base_domain}" : "api-${module.variables.domain_prefix}.${local.common_config.base_domain}"
}

module "api" {
  source = "../../../../modules/api-server"
  
  name_prefix  = "${local.common_config.project_name}-${module.variables.environment}"
  environment  = module.variables.environment
  instance_type = "t3.micro"
  subnet_id     = module.variables.subnet_id
  security_group_ids = module.variables.security_group_ids
  key_name     = module.variables.key_name
  
  env_vars = jsonencode({
    NODE_ENV     = module.variables.environment
    PORT         = module.variables.app_port
    DB_HOST      = module.variables.db_host
    DB_PORT      = module.variables.db_port
    DB_USERNAME  = module.variables.db_username
    DB_PASSWORD  = module.variables.db_password
    DB_DATABASE  = module.variables.db_database
  })

  tags = local.common_tags
}