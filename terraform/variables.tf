variable "gh_token" {
  description = "Github token"
  type        = string
}

variable "gh_repo_name" {
  description = "Github repository name"
  type        = string
}

variable "cf_api_token" {
  description = "Cloudflare API token"
  type        = string
  sensitive   = true
}

variable "cf_zone_id" {
  description = "Cloudflare zone ID"
  type        = string
  sensitive   = true
}

variable "cf_account_id" {
  description = "Cloudflare account ID"
  type        = string
  sensitive   = true
}

variable "cf_domain" {
  description = "Cloudflare domain"
  type        = string
}
