terraform {
  backend "s3" {
    bucket         = "jarryd-hashitalk-2022"
    dynamodb_table = "jarryd-hashitalk-2022"
    region         = "ap-southeast-2"
    key            = "terraform.tfstate"
    acl            = "private"
  }
  required_providers {
    buildkite = {
      source = "buildkite/buildkite"
      version = "0.11.0"
    }
  }
}

provider "buildkite" {
  organization = "hashitalk-2022"
}
