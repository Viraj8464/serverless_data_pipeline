# Get your AWS account ID
data "aws_caller_identity" "current" {}

# Generate a random suffix (8 hex characters)
resource "random_id" "suffix" {
  byte_length = 4
}

# Create an S3 bucket with a unique name
resource "aws_s3_bucket" "this" {
  bucket = "upload-bucket-data-pipeline-${data.aws_caller_identity.current.account_id}-${random_id.suffix.hex}"

  tags = {
    Name        = "upload-bucket-data-pipeline"
    Environment = "dev"
  }
}
