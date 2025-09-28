terraform {
  backend "s3" {
    bucket = "upload-bucket-data-pipeline-8464"
    key    = "serverless-pipeline/dev/terraform.tfstate"
    region = "eu-north-1"
  }
}
