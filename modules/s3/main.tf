resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
}

resource "aws_s3_object" "sample_data" {
  bucket = aws_s3_bucket.this.bucket
  key    = "sample-data/example.txt"
  content = "This is sample data"
}

resource "aws_s3_bucket_notification" "lambda_trigger" {
  bucket = aws_s3_bucket.this.id

  lambda_function {
    lambda_function_arn = var.lambda_function_arn
    events              = ["s3:ObjectCreated:*"]
  }

  depends_on = [aws_s3_bucket.this]
}
