data "aws_iam_policy" "iam_policy_AWSLambdaBasicExecutionRole" {
  arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

data "archive_file" "function_info" {
  type        = "zip"
  source_dir  = "${path.module}/src"
  output_path = "${path.module}/archive/lambda_function.zip"
}