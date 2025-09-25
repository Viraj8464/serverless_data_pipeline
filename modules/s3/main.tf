# Generate a random suffix to make bucket name globally unique
resource "random_id" "suffix" {
  byte_length = 4
}

# Create S3 bucket with unique name
resource "aws_s3_bucket" "this" {
  bucket        = "upload-bucket-data-pipeline-${random_id.suffix.hex}"
  force_destroy = true
}

# Upload sample object into the bucket
resource "aws_s3_object" "sample_data" {
  bucket       = aws_s3_bucket.this.id
  key          = "data/sample.json"
  source       = "${path.module}/sample.json"
  content_type = "application/json"
}

