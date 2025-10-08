variable "bucket_name" {
  description = "Name of S3 bucket"
  type        = string
}

resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_public_access_block" "block" {
  bucket                  = aws_s3_bucket.this.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_object" "sample_data" {
  bucket = aws_s3_bucket.this.id
  key    = "sample.json"
  source = "${path.module}/sample.json"
  etag   = filemd5("${path.module}/sample.json")
}

output "s3_bucket_name" {
  value = aws_s3_bucket.this.bucket
}

output "sample_object_url" {
  value = "s3://${aws_s3_bucket.this.bucket}/${aws_s3_object.sample_data.key}"
}
