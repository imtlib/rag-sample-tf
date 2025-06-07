resource "aws_lambda_function" "lambda_function" {
  function_name = "${var.prefix}-${var.application_name}-function"
  role          = aws_iam_role.iam_role_for_lambda.arn
  filename      = data.archive_file.function_info.output_path
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.10"
  layers        = ["arn:aws:lambda:ap-northeast-1:767398075406:layer:python-layer:2"]

  source_code_hash = data.archive_file.function_info.output_base64sha256

  depends_on = [aws_iam_role_policy_attachment.lambda_policy, aws_cloudwatch_log_group.cloudwatch_log]
}

resource "aws_lambda_permission" "logging" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda_function.function_name
  principal     = "events.amazonaws.com"
  source_arn    = var.eventbridge_rule_arn
}