# select security group
data "aws_security_group" "sg_tf_devops" {
  name = var.security_group_name
}
