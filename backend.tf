terraform {
  backend "s3" {
    bucket = "tf-state-sathu"
    key    = "statefile/terraform.tfstate"
    region = "us-east-1"
  }
}