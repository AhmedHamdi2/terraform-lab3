terraform {
  backend "s3" {
    bucket = "terraform-backup-bucket-labs"
    key = "terraform.tfstate"
    region = "us-east-1"
    profile = "terraform"
    
  }
}