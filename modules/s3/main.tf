# modules/s3/main.tf

# Create S3 Bucket
resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
  force_destroy = true

  # Optional: enable versioning
  versioning {
    enabled = true
  }

  tags = {
    Name = var.bucket_name
    Environment = "dev"
  }
}

# Optional: sample data upload
resource "aws_s3_object" "sample_data" {
  bucket  = aws_s3_bucket.this.bucket
  key     = "data/sample.json"
  source  = "modules/s3/sample.json"
  content_type = "application/json"
}

# S3 Bucket Notification to Lambda
resource "aws_s3_bucket_notification" "trigger" {
  bucket = aws_s3_bucket.this.bucket

  lambda_function {
    events              = ["s3:ObjectCreated:*"]
    lambda_function_arn = var.lambda_function_arn
    filter_prefix       = "data/"
    filter_suffix       = ".json"
  }
}
