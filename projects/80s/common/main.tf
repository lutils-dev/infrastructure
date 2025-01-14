locals {
  project_name = "80s"
  base_domain  = "80s.app"

  common_tags = {
    Project     = local.project_name
    ManagedBy   = "terraform"
  }

  acm_certificate_arn = "arn:aws:acm:us-east-1:290929038847:certificate/4fdeb252-ab3b-4772-8506-940056407072"
}
