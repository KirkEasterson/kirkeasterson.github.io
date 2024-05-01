data "github_user" "kirk" {
  username = "KirkEasterson"
}

data "github_repository" "source" {
  name = var.gh_repo_name
}
