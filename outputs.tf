
output "dh_black_bucket_name" {
  description = "The name of dh data bucket"
  value       = module.dreamhouse_black_app.s3_data_bucket_id
}

output "dh_black_bucket_arn" {
  description = "The ARN of dh data bucket"
  value       = module.dreamhouse_black_app.s3_data_bucket_arn
}

output "dh_config_bucket_name" {
  description = "Full ARN of the dh config S3 bucket"
  value       = module.dreamhouse_black_app.s3_config_bucket_id
}

output "dh_config_bucket_arn" {
  description = "Full ARN of the dh config S3 bucket"
  value       = module.dreamhouse_black_app.s3_config_bucket_arn
}

output "github_actions_oidc_role_arn" {
  description = "ARN of the IAM role GitHub Actions will assume"
  value       = module.dreamhouse_black_app.github_actions_role_arn
}
