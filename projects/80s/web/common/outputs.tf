output "deployment_info" {
  description = "Deployment information for the web application"
  value = {
    environment                = var.environment
    component                 = "web"
    cloudfront_distribution_id = module.website.cloudfront_distribution_id
    cloudfront_domain         = module.website.cloudfront_domain_name
    s3_bucket                 = module.website.s3_bucket_name
  }
}

resource "local_file" "deployment_info" {
  content  = jsonencode({
    environment                = var.environment
    component                 = "web"
    cloudfront_distribution_id = module.website.cloudfront_distribution_id
    cloudfront_domain         = module.website.cloudfront_domain_name
    s3_bucket                 = module.website.s3_bucket_name
  })
  filename = "${path.module}/../${var.environment}/deployment-info.json"
}