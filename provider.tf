terraform {
  required_providers {
    awscc = {
      source  = "hashicorp/awscc"
      version = "~> 0.27"   # latest version
    }
  }
}


provider "aws" {
  region = var.region
}
