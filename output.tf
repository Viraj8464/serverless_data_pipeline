output "lambda_function_arn" {
  description = "Lambda function ARN from module"
  value       = module.lambda_function.lambda_function_arn
}

output "s3_bucket_name" {
  value = module.s3_bucket.bucket_name
}

output "lambda_function_name" {
  value = module.lambda.lambda_name
}

output "glue_database" {
  value = module.glue.database_name
}

output "athena_workgroup" {
  value = module.athena.workgroup_name
}
