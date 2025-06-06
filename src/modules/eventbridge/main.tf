resource "aws_cloudwatch_event_rule" "eventbridge_rule" {
  name = "${var.prefix}-event-rule"

  event_pattern = jsonencode({
    "detail-type" : ["Object Created"],
    "source" : ["aws.s3"],
    "detail" : {
      "bucket" : {
        "name" : ["${var.prefix}-${var.application_name}-bucket"]
      },
      "object" : {
        "key" : [{
          "prefix" : "rag-docs/"
        }]
      }
    }
  })
}

resource "aws_cloudwatch_event_target" "eventbridge_target" {
  rule = aws_cloudwatch_event_rule.eventbridge_rule.name

  arn = var.lambda_function_arn
  input_transformer {
    input_paths = {
      "input_bucket_name" : "$.detail.bucket.name",
      "input_s3_key" : "$.detail.object.key"
    }
    input_template = <<TEMPLATE
{"Parameters": {"input_bucket_name":"<input_bucket_name>", "input_s3_key":"<input_s3_key>"}}
    TEMPLATE
  }
}