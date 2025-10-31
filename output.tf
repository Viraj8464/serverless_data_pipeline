output "s3_bucket_name" {
  value = module.s3_bucket.bucket_name
}

output "lambda_function_name" {
  value = module.lambda.lambda_functions["mylambda_name"]
}

output "lambda_function_arn" {
  value = module.lambda.lambda_functions["mylambda_arn"]
}

output "lambda_role_arn" {
  value = aws_iam_role.lambda_role.arn
}

output "glue_database_name" {
  value = module.glue.database_name
}

output "dynamodb_table_name" {
  value = module.dynamodb.table_name
}
output "databrew_stack_name" {
  value = module.databrew.databrew_stack_name
}

output "databrew_stack_outputs" {
  value = module.databrew.databrew_stack_outputs
}
