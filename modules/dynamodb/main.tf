resource "aws_dynamodb_table" "this" {
  name         = "pipeline_metadata"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }
}
