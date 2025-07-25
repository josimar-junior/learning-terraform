resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "bucket" {
  bucket = "bucket-imput-vars-${random_id.bucket_suffix.hex}"
}