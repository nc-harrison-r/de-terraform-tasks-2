resource "aws_s3_bucket" "demo_bucket" {
  bucket_prefix = "harrisons-demo-bucket-"
}

resource "aws_s3_object" "demo_object" {
  # TO BE IMPLEMENTED
  bucket = aws_s3_bucket.demo_bucket.id
  key    = "text_file"
  source = "test_file.txt"
}
