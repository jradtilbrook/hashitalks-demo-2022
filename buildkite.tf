resource "buildkite_agent_token" "fleet" {
    description = "token used by build fleet"
}

resource "aws_cloudformation_stack" "buildkite_agent_default" {
  name         = "jarryd-hashitalks-2022"
  template_url = "https://s3.amazonaws.com/buildkite-aws-stack/latest/aws-stack.yml"
  capabilities = ["CAPABILITY_AUTO_EXPAND", "CAPABILITY_NAMED_IAM"]
  parameters =  {
    AgentsPerInstance        = 1
    InstanceType             = "t3.small"
    KeyName                  = "jarryd MBP"
    ManagedPolicyARN         = "arn:aws:iam::aws:policy/AdministratorAccess"
    MaxSize                  = 1
    MinSize                  = 1
    RootVolumeSize           = 50
    BuildkiteAgentToken      = buildkite_agent_token.fleet.token
  }
}
