resource "aws_cloudformation_type" "newcloud" {
  schema_handler_package = "s3://${aws_s3_object.example.bucket}/${aws_s3_object.example.key}"
  type                   = "RESOURCE"
  type_name              = "KPMG::Cloud9::EC2INSTANCE"

  logging_config {
    log_group_name = aws_cloudwatch_log_group.newcloud.Cloud9
    log_role_arn   = aws_iam_role.aws_cloudformation_type.arn
  }

  lifecycle {
    create_before_destroy = true
  }
}