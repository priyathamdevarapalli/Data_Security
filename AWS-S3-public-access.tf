resource "aws_s3_bucket" "example" {
  bucket = "test-bucket-highmark"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
    git_repo    = "Data_Security"
    yor_trace   = "e618c50b-095c-42e2-8ef0-9a3e6e7a46f1"
  }
}