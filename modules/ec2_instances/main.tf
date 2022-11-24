# terraform {
#   required_providers {
#     aws = {
#       source = "hashicorp/aws"
#     }
#   }
#   backend "http" {
#   }



# }

# provider "aws" {
#   profile = var.profile
#   region  = var.region
# }





resource "aws_instance" "devops" {
  count                       = length(data.aws_subnets.subnets.ids)
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.environment_instance_settings[var.deploy_environment][var.instance_type]
  vpc_security_group_ids      = [aws_security_group.sg_tf_devops.id]
  key_name                    = var.generated_key_name
  associate_public_ip_address = false
  subnet_id                   = data.aws_subnets.subnets.ids[count.index]

  ebs_block_device {
    device_name = "/dev/sda1"
    volume_size = var.volume_size
  }


  # provisioner "file" {
  #   source      = var.script_operation[0]
  #   destination = var.script_operation[1]
  # }
  # # Change permissions on bash script and execute from ec2-user.
  # provisioner "remote-exec" {
  #   inline = [
  #     var.script_operation[2],
  #     var.script_operation[3]
  #   ]
  # }

  # # Login to the ec2-user with the aws key.
  # connection {
  #   type = "ssh"
  #   user = "ubuntu"
  #   # private_key = file("${var.generated_key_name}.pem")
  #   private_key = tls_private_key.dev_key.private_key_pem
  #   host        = self.private_ip
  # }

  tags = {
    Name        = "${var.instances_name}${count.index}"
    Environment = var.environment_map[var.deploy_environment]
  }

  depends_on = [
    aws_security_group.sg_tf_devops,
    aws_key_pair.generated_key,
    var.deploy_environment,
    var.environment_list
  ]

}

