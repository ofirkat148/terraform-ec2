data "aws_vpcs" "devops" {}


data "aws_vpc" "devops" {
  tags = {
    "Name" = var.devops
  }
}
