terraform {
  backend "s3" {
    bucket         = "jarryd-hashitalk-2022"
    dynamodb_table = "jarryd-hashitalk-2022"
    region         = "ap-southeast-2"
    key            = "terraform.tfstate"
    acl            = "private"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    buildkite = {
      source = "buildkite/buildkite"
      version = "0.11.0"
    }
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-2"
}

provider "buildkite" {
  # api_token set from BUILDKITE_API_TOKEN
  organization = "hashitalk-2022"
}

provider "github" {
  # token set from GITHUB_TOKEN
}
