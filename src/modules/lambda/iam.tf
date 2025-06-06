resource "aws_iam_policy" "iam_policy_AWSLambdaBasicExecutionRole" {
  name   = "${var.prefix}-lambda-service-role"
  policy = data.aws_iam_policy.iam_policy_AWSLambdaBasicExecutionRole.policy
}

resource "aws_iam_role_policy_attachment" "lambda_policy" {
  role       = aws_iam_role.iam_role_for_lambda.name
  policy_arn = aws_iam_policy.iam_policy_AWSLambdaBasicExecutionRole.arn
}

resource "aws_iam_role" "iam_role_for_lambda" {
  name               = "iam_for_lambda"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}