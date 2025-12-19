resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
}

resource "aws_lambda_permission" "allow_s3" {
  statement_id  = "AllowS3Invoke"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_arn
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.this.arn
}

resource "aws_s3_bucket_notification" "notify" {
  bucket = aws_s3_bucket.this.id

  lambda_function {
    lambda_function_arn = var.lambda_arn
    events              = ["s3:ObjectCreated:*"]
    filter_prefix       = "data/"
  }
}
