# output "public_ip" {
#   value = aws_instance.servers.*.public_ip
# }
output "vpc" {
  value = data.aws_vpcs.devops.ids
}

output "private_ip" {
  value = [for instance in aws_instance.devops : instance.private_ip]
}

output "ami" {
  value = data.aws_ami.ubuntu
}


output "aws_instnaces" {
  value = data.aws_instances.devops.id
}

output "ec2_test_key" {
  value = var.ec2_test_key
}


# output "subnet_cidr_blocks" {
#   value = [for subnet in data.aws_subnet.subnet : subnet.cidr_block]
# }

