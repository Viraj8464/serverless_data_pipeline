resource "aws_glue_catalog_database" "this" {
  name = "glue_database"
}

# example usage of bucket_name
resource "aws_glue_crawler" "this" {
  database_name = aws_glue_catalog_database.this.name
  s3_target {
    path = "s3://${var.bucket_name}/data/"
  }
}
