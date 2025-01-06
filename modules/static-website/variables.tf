variable "bucket_name" {
  description = "Name of the S3 bucket (must match domain name for static website hosting)"
  type        = string
}

variable "aliases" {
  description = "List of alternate domain names (CNAMEs)"
  type        = list(string)
}

variable "origin_id" {
  description = "Unique identifier for the origin"
  type        = string
}

variable "viewer_protocol_policy" {
  description = "Protocol policy for viewer connections"
  type        = string
  default     = "redirect-to-https"
}

variable "cache_policy_id" {
  description = "ID of the cache policy to use"
  type        = string
  default     = "658327ea-f89d-4fab-a63d-7e88639e58f6"
}

variable "acm_certificate_arn" {
  description = "ARN of ACM SSL certificate"
  type        = string
}

variable "custom_error_responses" {
  description = "List of custom error response configurations"
  type = list(object({
    error_code         = number
    response_code      = number
    response_page_path = string
  }))
  default = []
}
