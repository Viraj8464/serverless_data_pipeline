output "s3_bucket_name" {
  value = module.s3.bucket_name
}

output "lambda_function_name" {
  value = module.lambda.function_name
}

output "lambda_role_name" {
  value = aws_iam_role.lambda_role.name
}
