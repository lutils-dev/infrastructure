locals {
  project_name = "lazysheet"
  base_domain  = "lazysheet.com"
  
  common_tags = {
    Project     = local.project_name
    ManagedBy   = "terraform"
  }

  acm_certificate_arn = "arn:aws:acm:us-east-1:290929038847:certificate/9f177ca1-3f9a-4c41-9e35-af4cbd660cff"
}
