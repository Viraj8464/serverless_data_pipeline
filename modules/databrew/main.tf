resource "awscc_databrew_dataset" "this" {
  name = "databrew_dataset"
  input {
    s3_input_definition {
      bucket = var.bucket_name
      key    = "data/raw/"
    }
  }
}
