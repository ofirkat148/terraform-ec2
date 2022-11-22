# select security group
data "aws_security_group" "sg_ssh" {
  name = var.security_group_name
}
