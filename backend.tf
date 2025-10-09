terraform {
  backend "s3" {
    bucket = "upload-bucket-data-pipeline"
    key    = "terraform/state/terraform.tfstate"
    region = "us-east-1"
  }
}
