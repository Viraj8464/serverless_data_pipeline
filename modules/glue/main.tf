resource "aws_glue_crawler" "this" {
  name         = "cleaned-crawler"
  role         = "AWSGlueServiceRoleDefault"
  database_name = "cleaned_db"

  s3_target {
    path = "s3://${var.bucket_name}/cleaned/"
  }
}
