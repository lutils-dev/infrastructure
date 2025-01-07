variable "environment" {
  description = "Environment name (e.g., prod, staging)"
  type        = string

  validation {
    condition     = contains(["prod", "staging"], var.environment)
    error_message = "Environment must be either 'prod' or 'staging'"
  }
}

variable "domain_prefix" {
  description = "Domain prefix for the environment"
  type        = string
  default     = ""
}
