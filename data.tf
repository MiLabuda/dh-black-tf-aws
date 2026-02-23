# Remote state for shared infrastructure
data "terraform_remote_state" "shared" {
  backend = "s3"
  config = {
    bucket = "tf-remote-state-eu-west-1-354918401085"
    key    = "prod/dh-shared/terraform.tfstate"
    region = "eu-west-1"
  }
}

data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

data "aws_ssm_parameter" "new_relic_api_key" {
  name = var.new_relic_api_key
}
