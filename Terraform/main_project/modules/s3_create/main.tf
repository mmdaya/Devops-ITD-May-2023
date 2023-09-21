resource "aws_s3_bucket" "s3_backend" {
    bucket = var.bucket_name
}

resource "aws_s3_bucket_server_side_encryption_configuration" "s3_backend_sse" {
  bucket = aws_s3_bucket.s3_backend.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = var.sse_algorithm_type
    }
  }
}

resource "aws_s3_bucket_versioning" "s3_backend_versioning" {
  bucket = aws_s3_bucket.s3_backend.id
  versioning_configuration {
    status = "Enabled"
  }

  depends_on = [
    aws_s3_bucket_server_side_encryption_configuration.s3_backend_sse
  ]
}