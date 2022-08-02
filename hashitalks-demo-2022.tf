resource "buildkite_pipeline" "hashitalks-demo-2022" {
  name = "hashitalks-demo-2022"
  repository = "git@github.com:jradtilbrook/hashitalks-demo-2022.git"
  default_branch = "main"
  steps = <<STEPS
  steps:
  - label: ':pipeline:'
    command: buildkite-agent pipeline upload
  STEPS
}

data "github_repository" "hashitalks-demo-2022" {
  full_name = "jradtilbrook/hashitalks-demo-2022"
}

resource "github_repository_webhook" "hashitalks-demo-2022_buildkite" {
  repository = data.github_repository.hashitalks-demo-2022.name

  configuration {
    url          = buildkite_pipeline.hashitalks-demo-2022.webhook_url
    content_type = "application/json"
    insecure_ssl = false
  }

  active = true

  events = ["deployment", "push", "pull_request"]
}
