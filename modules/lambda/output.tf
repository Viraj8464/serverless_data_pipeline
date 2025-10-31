output "lambda_functions" {
  description = "Lambda functions created by this module"
  value = {
    mylambda_name = aws_lambda_function.mylambda.function_name
    mylambda_arn  = aws_lambda_function.mylambda.arn
  }
}


