resource "aws_s3_bucket" "bucket" {
  bucket        = "${var.prefix}-${var.application_name}-bucket"
  force_destroy = true
}

resource "aws_s3_object" "rag-docs" {
  bucket = aws_s3_bucket.bucket.id
  key    = "rag-docs/"
}

resource "aws_s3_object" "rag-images" {
  bucket = aws_s3_bucket.bucket.id
  key    = "rag-images/"
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket      = aws_s3_bucket.bucket.bucket
  eventbridge = true
}