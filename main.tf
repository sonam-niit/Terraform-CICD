provider "aws" {
  region = "us-east-1"
}
terraform {
  backend "s3" {
    bucket = "remote-backend-s3-sonam"
    key = "terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    # dynamodb_table = "table_name" # used for Locking state when multiple users using
  }
}
resource "aws_instance" "example" {
  ami = "ami-0f3caa1cf4417e51b"
  instance_type= "t2.micro"

  tags = {
    Name = "myapp-${var.env}"
  }
}