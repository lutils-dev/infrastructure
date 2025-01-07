terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

module "web" {
  source = "../common"
  
  environment = "staging"
  domain_prefix = "staging"
}