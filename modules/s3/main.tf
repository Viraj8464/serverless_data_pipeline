resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "this" {
  bucket        = "upload-bucket-data-pipeline-${random_id.bucket_suffix.hex}"
  force_destroy = true

  tags = {
    Name        = "Data Pipeline Bucket"
    Environment = "Dev"
  }
}
