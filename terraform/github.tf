data "github_user" "kirk" {
  username = "KirkEasterson"
}

resource "github_repository" "this" {
  name         = "kirkeasterson.github.io"
  description  = "My personal website"
  homepage_url = "https://www.${var.domain}"

  visibility             = "public"
  delete_branch_on_merge = true
  allow_update_branch    = true
  has_discussions        = false
  has_downloads          = false
  has_issues             = false
  has_projects           = false
  has_wiki               = false
  vulnerability_alerts   = true

  pages {
    cname = "www.${var.domain}"
    source {
      branch = "gh-pages"
    }
  }
}

resource "github_branch" "main" {
  repository = github_repository.this.name
  branch     = "main"
}

resource "github_branch_default" "this" {
  repository = github_repository.this.name
  branch     = github_branch.main.branch
}

resource "github_branch_protection" "default" {
  repository_id = github_repository.this.name

  pattern                         = "main"
  enforce_admins                  = false
  allows_deletions                = false
  allows_force_pushes             = false
  require_conversation_resolution = true

  required_status_checks {
    strict = true
  }

  required_pull_request_reviews {
    dismiss_stale_reviews      = false
    require_code_owner_reviews = true
  }

  force_push_bypassers = [
    data.github_user.kirk.node_id,
  ]
}
