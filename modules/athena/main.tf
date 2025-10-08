resource "aws_athena_workgroup" "this" {
  name = "data_pipeline_workgroup"

  configuration {
    result_configuration {
      output_location = "s3://${var.bucket_name}/athena-results/"
    }
  }
}

output "workgroup_name" {
  value = aws_athena_workgroup.this.name
}
