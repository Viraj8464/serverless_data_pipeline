terraform {
  backend "s3" {
    bucket = "upload-bucket-data-pipeline-8464"  # <- new bucket
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
