terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "4.10.0"
    }
  }
}

provider "github" {
  token = "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"
}

resource "github_repository" "example" {
  name        = "my-repo"
  description = "My Git repository created with Terraform"
  visibility  = "public"
}
