resource "aws_athena_workgroup" "this" {
  name = "athena_workgroup"
  configuration {
    result_configuration {
      output_location = "s3://${var.bucket_name}/athena-results/"
    }
  }
}
