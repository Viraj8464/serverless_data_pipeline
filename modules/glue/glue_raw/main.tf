resource "aws_glue_catalog_database" "this" {
  name = "raw_database"
}

resource "aws_glue_catalog_table" "this" {
  name          = "raw_table"
  database_name = aws_glue_catalog_database.this.name
  table_type    = "EXTERNAL_TABLE"
  storage_descriptor {
    location = "s3://${var.bucket_name}/data/raw/"
    input_format  = "org.apache.hadoop.mapred.TextInputFormat"
    output_format = "org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat"
  }
}
