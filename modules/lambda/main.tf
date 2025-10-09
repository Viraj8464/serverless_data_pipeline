resource "aws_lambda_function" "this" {
  function_name = var.function_name
  role          = var.role_arn
  handler       = "databrew_trigger.lambda_handler"
  runtime       = "python3.9"

  filename         = "${path.module}/src/databrew_trigger.zip"
  source_code_hash = filebase64sha256("${path.module}/src/databrew_trigger.zip")

  environment {
    variables = {
      BUCKET_NAME = var.bucket_name
    }
  }
}

output "function_name" {
  value = aws_lambda_function.this.function_name
}
