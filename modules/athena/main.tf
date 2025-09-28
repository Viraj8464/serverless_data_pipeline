resource "aws_athena_workgroup" "this" {
  name = "my-athena-workgroup"
  configuration {
    result_configuration {
     output_location = "s3://${var.bucket_name}/athena-results/"
    }
  }
  force_destroy = true
}
