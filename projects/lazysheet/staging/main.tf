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
  
  bucket_name = "staging.lazysheet.com"
  aliases     = ["staging.lazysheet.com"]
  origin_id   = "lazysheet-staging"
  acm_certificate_arn = "arn:aws:acm:us-east-1:290929038847:certificate/9f177ca1-3f9a-4c41-9e35-af4cbd660cff"
  custom_error_responses = [
    {
      error_code = 403
      response_code = 200
      response_page_path = "/index.html"
    },
    {
      error_code = 404
      response_code = 200
      response_page_path = "/index.html"
    }
  ]
}
