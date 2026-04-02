terraform {
  backend "s3" {
    bucket         = "" # provided via -backend-config in CI
    key            = "eks/terraform.tfstate"
    region         = "us-west-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
