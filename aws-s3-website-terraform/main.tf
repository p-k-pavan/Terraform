resource "aws_s3_bucket" "s3-bucket" {
  bucket = var.backetname
}

resource "aws_s3_bucket_ownership_controls" "control" {
  bucket = aws_s3_bucket.s3-bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "block" {
  bucket = aws_s3_bucket.s3-bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "acl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.control,
    aws_s3_bucket_public_access_block.block
  ]

  bucket = aws_s3_bucket.s3-bucket.id
  acl    = "public-read"
}

resource "aws_s3_object" "index" {
  bucket       = aws_s3_bucket.s3-bucket.id
  key          = "index.html"
  source       = "index.html"
  acl          = "public-read"
  content_type = "text/html"
}

resource "aws_s3_object" "error" {
  bucket       = aws_s3_bucket.s3-bucket.id
  key          = "error.html"
  source       = "error.html"
  acl          = "public-read"
  content_type = "text/html"
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.s3-bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  depends_on = [aws_s3_bucket_acl.acl]
}
