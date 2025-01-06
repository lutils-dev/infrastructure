resource "local_file" "deployment_info" {
  content = jsonencode({
    cloudfront_distribution_id = module.website.cloudfront_distribution_id
    cloudfront_domain = module.website.cloudfront_domain_name
    s3_bucket = module.website.s3_bucket_name
  })
  filename = "${path.module}/deployment-info.json"
}
