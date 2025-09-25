resource "random_id" "suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "this" {
  bucket        = "myfirstbucket-8464-${random_id.suffix.hex}"
  force_destroy = true
}


# Upload a sample object into the bucket
resource "aws_s3_object" "sample_data" {
  bucket       = aws_s3_bucket.this.id
  key          = "data/sample.json"
  source       = "${path.module}/sample.json"
  content_type = "application/json"
}

