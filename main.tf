# DreamHouse Black - Application Infrastructure
# Uses dreamhouse-app module for all application resources

module "dreamhouse_black_app" {
  source = "git::https://github.com/MiLabuda/dh-terraform-modules.git//modules/dreamhouse-app?ref=1.3.0"

  # Basic Configuration
  environment    = var.environment
  app_group_name = var.app_group_name
  app_name       = var.app_name
  aws_region     = var.aws_region

  # Network Configuration (from shared infrastructure)
  vpc_id                = data.terraform_remote_state.shared.outputs.vpc_id
  public_subnet_ids     = data.terraform_remote_state.shared.outputs.public_subnet_ids
  public_route_table_id = data.terraform_remote_state.shared.outputs.public_route_table_id

  # Shared Resources
  log_forwarder_ecr_repository_url = data.terraform_remote_state.shared.outputs.log_forwarder_ecr_repository_url

  # Shared Storage
  data_bucket_id    = data.terraform_remote_state.shared.outputs.data_bucket_id
  data_bucket_arn   = data.terraform_remote_state.shared.outputs.data_bucket_arn
  config_bucket_id  = data.terraform_remote_state.shared.outputs.config_bucket_id
  config_bucket_arn = data.terraform_remote_state.shared.outputs.config_bucket_arn

  # ECR Configuration
  client_repo_name = var.client_repo_name
  config_repo_name = var.config_repo_name

  # Image Tags
  client_image_tag        = var.client_image_tag
  config_version_tag      = var.config_version_tag
  log_forwarder_image_tag = var.log_forwarder_image_tag

  # Secrets
  new_relic_api_key_ssm_path = var.new_relic_api_key

  # ECS Configuration
  provinces = var.provinces

  # GitHub OIDC
  github_repos = var.github_repos

  # Tags
  additional_tags = {
    Project     = "DreamHouse"
    Application = "Black"
    ManagedBy   = "Terraform"
  }
}
