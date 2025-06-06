resource "aws_cloudwatch_log_group" "cloudwatch_log" {
  name = "/aws/lambda/${var.prefix}-${var.application_name}-function"
}