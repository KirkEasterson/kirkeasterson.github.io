provider "cloudflare" {
  api_token = var.cf_api_token
}

provider "github" {
  token = var.gh_token
}
