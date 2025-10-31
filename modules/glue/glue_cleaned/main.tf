resource "aws_glue_catalog_database" "this" {
  name = "cleaned_database"
}

resource "aws_glue_catalog_table" "cleaned_table" {
  name          = "cleaned_table"
  database_name = aws_glue_catalog_database.this.name
  table_type    = "EXTERNAL_TABLE"

  storage_descriptor {
    location      = "s3://${var.bucket_name}/data/cleaned/"
    input_format  = "org.apache.hadoop.mapred.TextInputFormat"
    output_format = "org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat"

    ser_de_info {
      name                  = "OpenCSVSerde"
      serialization_library = "org.apache.hadoop.hive.serde2.OpenCSVSerde"
    }
  }
}

output "database_name" {
  value = aws_glue_catalog_database.this.name
}

