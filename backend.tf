terraform {
  backend "s3" {
    bucket = "mybucket-sneha"
    key    = "global/s3/terraform.tfstate"
    region = "ap-south-1"

  }

}