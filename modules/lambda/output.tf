output "lambda_function_arn" {
  value = aws_lambda_function.this.arn
}

output "function_name" {
  value = aws_lambda_function.this.function_name
}
output "lambda_functions" {
  value = {
    databrew_trigger        = aws_lambda_function.databrew_trigger.function_name
    databrew_trigger_arn    = aws_lambda_function.databrew_trigger.arn
    dynamodb_to_s3          = aws_lambda_function.dynamodb_to_s3.function_name
    dynamodb_to_s3_arn      = aws_lambda_function.dynamodb_to_s3.arn
  }
}

