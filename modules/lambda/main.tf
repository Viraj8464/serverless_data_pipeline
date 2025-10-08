resource "aws_lambda_function" "this" {
  function_name = var.lambda_function_name
  role          = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${var.iam_role_name}"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.9"
  filename      = "src/lambda_payload.zip"

  environment {
    variables = {
      BUCKET_NAME = var.bucket_name
    }
  }
}

data "aws_caller_identity" "current" {}

resource "aws_lambda_event_source_mapping" "dynamodb_trigger" {
  event_source_arn  = var.dynamodb_stream_arn
  function_name     = aws_lambda_function.this.arn
  starting_position = "LATEST"
}

resource "aws_lambda_permission" "allow_s3" {
  statement_id  = "AllowExecutionFromS3"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.this.function_name
  principal     = "s3.amazonaws.com"
  source_arn    = "arn:aws:s3:::${var.bucket_name}"
}

output "lambda_name" {
  value = aws_lambda_function.this.function_name
}

output "lambda_arn" {
  value = aws_lambda_function.this.arn
}

output "lambda_permission" {
  value = aws_lambda_permission.allow_s3.id
}
