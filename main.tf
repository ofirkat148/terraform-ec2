terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
  backend "http" {
  }

}

provider "aws" {
  # profile    = var.profile
  # region     = var.region
  # access_key = var.aws_access_key
  # secret_key = var.aws_secret_access_key
}


module "ec2_instances" {
  source = "./modules/ec2_instances"
  
  #   here we can change all the of the module vars
  #   and it will inherit them when we terraform init, fmt, validate,apply, destroy.
  ec2_test_key = var.ec2_test_key
}


