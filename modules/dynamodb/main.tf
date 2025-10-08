resource "aws_dynamodb_table" "this" {
  name         = "pipeline-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }

  stream_enabled   = true
  stream_view_type = "NEW_IMAGE"
}

output "stream_arn" {
  value = aws_dynamodb_table.this.stream_arn
}
