terraform {
  required_providers {
    github = {
      source = "integrations/github"
      version = "6.2.0"
    }
  }
}

provider "github" {
  # Configuration options
}

resource "github_branch" "development" {
  repository = "gitpractice"
  branch     = "sdks"
}