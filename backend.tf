terraform {
  backend "s3" {
    bucket = "mybucket-sneha1"
    key    = "global/s3/terraform.tfstate"
    region = "ap-south-1"

  }

}