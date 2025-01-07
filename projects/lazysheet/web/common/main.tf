locals {
  common_config = {
    project_name         = "lazysheet"
    base_domain         = "lazysheet.com"
    acm_certificate_arn = "arn:aws:acm:us-east-1:290929038847:certificate/9f177ca1-3f9a-4c41-9e35-af4cbd660cff"
  }

  common_tags = {
    Project   = local.common_config.project_name
    ManagedBy = "terraform"
  }

  web_config = {
    cache_policy_id        = "658327ea-f89d-4fab-a63d-7e88639e58f6"
    custom_error_responses = [
      {
        error_code            = 403
        response_code         = 200
        response_page_path    = "/index.html"
        error_caching_min_ttl = 0
      },
      {
        error_code            = 404
        response_code         = 200
        response_page_path    = "/index.html"
        error_caching_min_ttl = 0
      }
    ]
    viewer_protocol_policy = "redirect-to-https"
  }

  domain = var.domain_prefix == "" ? local.common_config.base_domain : "${var.domain_prefix}.${local.common_config.base_domain}"
  aliases = var.environment == "prod" ? [local.common_config.base_domain, "www.${local.common_config.base_domain}"] : [local.domain]
}

module "website" {
  source = "../../../../modules/static-website"
  
  bucket_name = local.domain
  aliases     = local.aliases
  origin_id   = "${local.common_config.project_name}-web-${var.environment}"
  
  acm_certificate_arn    = local.common_config.acm_certificate_arn
  cache_policy_id        = local.web_config.cache_policy_id
  viewer_protocol_policy = local.web_config.viewer_protocol_policy
  custom_error_responses = local.web_config.custom_error_responses
}