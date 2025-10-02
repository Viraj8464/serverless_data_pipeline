resource "aws_s3_bucket_notification" "lambda_trigger" {
  count  = var.lambda_function_arn == null ? 0 : 1
  bucket = aws_s3_bucket.this.id

  lambda_function {
    lambda_function_arn = var.lambda_function_arn
    events              = ["s3:ObjectCreated:*"]
  }
}
