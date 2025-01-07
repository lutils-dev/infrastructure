terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

module "variables" {
  source = "../variables"
}

module "api" {
  source = "../common"
  
  environment        = module.variables.environment
  domain_prefix     = module.variables.domain_prefix
  subnet_id         = module.variables.subnet_id
  security_group_ids = module.variables.security_group_ids
  key_name          = module.variables.key_name
  app_port          = module.variables.app_port
  db_host           = module.variables.db_host
  db_port           = module.variables.db_port
  db_username       = module.variables.db_username
  db_password       = module.variables.db_password
  db_database       = module.variables.db_database
}