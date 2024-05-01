data "cloudflare_accounts" "cloudflare_account_data" {
  name = "kirkeasterson"
}

resource "cloudflare_pages_project" "source_config" {
  account_id        = var.cf_account_id
  name              = replace(var.gh_repo_name, ".", "-")
  production_branch = github_branch_default.this.branch

  build_config {
    build_command   = "hugo --gc --minify"
    destination_dir = "public"
    root_dir        = "src"
    build_caching   = true
  }

  source {
    type = "github"
    config {
      owner                         = data.github_user.kirk.username
      repo_name                     = var.gh_repo_name
      production_branch             = github_branch_default.this.branch
      pr_comments_enabled           = true
      deployments_enabled           = true
      production_deployment_enabled = true
      preview_deployment_setting    = "custom"
      preview_branch_excludes = [
        github_branch_default.this.branch,
        "gh-pages"
      ]
    }
  }
}
