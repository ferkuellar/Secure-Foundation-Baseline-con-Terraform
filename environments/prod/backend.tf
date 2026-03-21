terraform {
  backend "s3" {
    bucket         = "REPLACE_ME_TFSTATE_BUCKET"
    key            = "terraform-secure-foundation/dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "REPLACE_ME_TF_LOCKS"
    encrypt        = true
  }
}