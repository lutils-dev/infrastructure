terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

module "website" {
  source = "../../../modules/static-website"
  
  bucket_name = "lazysheet.com"
  aliases     = ["lazysheet.com", "www.lazysheet.com"]
  origin_id   = "lazysheet-production"
  acm_certificate_arn = "arn:aws:acm:us-east-1:290929038847:certificate/9f177ca1-3f9a-4c41-9e35-af4cbd660cff"
  custom_error_responses = []
}
