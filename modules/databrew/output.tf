# Output the CloudFormation stack name and outputs

output "databrew_stack_name" {
  description = "Name of the deployed DataBrew CloudFormation stack"
  value       = aws_cloudformation_stack.databrew_stack.name
}

output "databrew_stack_outputs" {
  description = "Outputs from the DataBrew CloudFormation stack"
  value       = aws_cloudformation_stack.databrew_stack.outputs
}
