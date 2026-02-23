
variable "environment" {
  description = "Environment name"
  type        = string
}

variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
}

variable "app_group_name" {
  description = "Name of the application group"
  type        = string
}

variable "app_name" {
  description = "Name of the application"
  type        = string
}

variable "client_repo_name" {
  description = "Name of the client repository"
  type        = string
}

variable "config_repo_name" {
  description = "Name of the config repository"
  type        = string
}

variable "log_forwarder_repo_name" {
  description = "Name of the log forwarder repository"
  type        = string
}

variable "new_relic_api_key" {
  description = "Name of the New Relic secret in AWS Secrets Manager"
  type        = string
}

variable "client_image_tag" {
  description = "Docker image tag for the client application"
  type        = string
}

variable "config_version_tag" {
  description = "Version tag for the configuration"
  type        = string
}

variable "log_forwarder_image_tag" {
  description = "Docker image tag for the log forwarder"
  type        = string
}

variable "provinces" {
  type = map(object({
    cpu    = number
    memory = number
  }))
  default = {
    "malopolskie" = { cpu = 512, memory = 1024 }
  }
}

variable "github_repos" {
  description = "List of GitHub repositories allowed to assume OIDC role"
  type        = list(string)
}
