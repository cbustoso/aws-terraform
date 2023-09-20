terraform {
  backend "s3" {
    bucket = "labiac-tfstate"
    key    = "labiac.tfstate"
    region = "us-east-1"
  }
}
