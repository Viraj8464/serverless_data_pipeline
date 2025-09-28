resource "aws_s3_bucket" "primary" {
  bucket = "upload-bucket-data-pipeline-8464"
}

resource "aws_s3_bucket" "secondary" {
  bucket = "myfirstbucket-8464"
}
