resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
  acl    = "private"

  tags = {
    Name        = var.bucket_name
    Environment = "Dev"
  }
}

# S3 → Lambda notification
resource "aws_s3_bucket_notification" "lambda_trigger" {
  bucket = aws_s3_bucket.this.id

  lambda_function {
    lambda_function_arn = var.lambda_function_arn
    events              = ["s3:ObjectCreated:*"] # triggers on object creation
  }

  depends_on = [aws_lambda_permission.allow_s3]
}

# Permission so S3 can invoke Lambda
resource "aws_lambda_permission" "allow_s3" {
  statement_id  = "AllowExecutionFromS3"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_function_name
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.this.arn
}
