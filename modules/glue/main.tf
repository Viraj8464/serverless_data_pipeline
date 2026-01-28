resource "aws_glue_catalog_database" "this" {
  name = "pipeline_db"
}
resource "aws_glue_crawler" "this" {
  name         = "cleaned-crawler"
  role         =  var.glue_role_arn
  database_name = aws_glue_catalog_database.this.name

  s3_target {
    path = "s3://${var.bucket_name}/cleaned/"
  }
}
