output "lambda_function_arn" {
  description = "Lambda function ARN from module"
  value       = module.lambda_function.lambda_function_arn
}

output "lambda_function_name" {
  description = "Lambda function name from module"
  value       = module.lambda_function.function_name
}

output "s3_bucket_name" {
  description = "S3 bucket name from module"
  value       = module.s3_bucket.bucket_name
}
