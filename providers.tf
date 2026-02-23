terraform {
  required_version = ">= 1.9.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  backend "s3" {
    bucket         = "tf-remote-state-eu-west-1-354918401085"
    key            = "prod/dh-black/terraform.tfstate"
    region         = "eu-west-1"
    encrypt        = true
    dynamodb_table = "terraform-lock-table"
  }
}

provider "aws" {
  region = "eu-west-1"

  assume_role {
    role_arn = "arn:aws:iam::354918401085:role/terraform-execution_role"
  }
  default_tags {
    tags = {
      Project   = "DreamHouse"
      ManagedBy = "Terraform"
    }
  }
}
