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
