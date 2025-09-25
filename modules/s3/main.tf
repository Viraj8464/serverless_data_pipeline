# Create S3 bucket with fixed name
resource "aws_s3_bucket" "this" {
  bucket        = "myfirstbucket-8464"  # your fixed bucket name
  force_destroy = true
}

# Upload a sample object into the bucket
resource "aws_s3_object" "sample_data" {
  bucket       = aws_s3_bucket.this.id
  key          = "data/sample.json"
  source       = "${path.module}/sample.json"
  content_type = "application/json"
}

