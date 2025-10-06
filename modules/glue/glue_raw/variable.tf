variable "bucket_name" {
  description = "The S3 bucket name to use for data or query results"
  type        = string
}
variable "database_name" {
  description = "Glue Catalog Database Name"
  type        = string
}
variable "table_name" {
  description = "Glue Catalog Table Name"
  type        = string
}
variable "s3_location" {
  description = "S3 Bucket Path"
  type        = string
}
