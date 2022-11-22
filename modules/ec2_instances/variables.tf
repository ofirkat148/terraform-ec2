# variable "profile" {
#   default = "default"
# }
variable "devops" {
  default = "devops"
}

variable "region" {
  default = "eu-west-1"
}

variable "aws_access_key" {
  type        = string
  default     = "it is a secret"
  description = "we store it somewhere safe"
}

variable "aws_secret_access_key" {
  type        = string
  default     = "it is a secret"
  description = "we store it somewhere safe"
}



variable "instance_count" {
  default = 4
}

variable "instances_name" {
  type        = string
  default     = "tf-ec2-instance-"
  description = "ec2 instances name"
}


variable "ami" {
  default = "ami-07702eb3b2ef420a9"
}

variable "volume_size" {
  default = "9"
}

variable "deploy_environment" {
  default = "DEV"
}
variable "instance_type" {
  default = "instance_type"
}
variable "environment_instance_type" {
  type = map(string)
  default = {
    "DEV"   = "t2.micro",
    "QA"    = "t2.micro",
    "STAGE" = "t2.micro",
    "PROD"  = "t2.micro"
  }
}

variable "environment_map" {
  type = map(string)
  default = {
    "DEV"   = "DEV",
    "QA"    = "QA",
    "STAGE" = "STAGE",
    "PROD"  = "PROD"
  }
}


variable "environment_instance_settings" {
  type = map(object({ instance_type = string, monitoring = bool }))
  default = {
    "DEV" = {
      instance_type = "t2.micro",
      monitoring    = false
    },
    "QA" = {
      instance_type = "t2.micro",
      monitoring    = false
    },
    "STAGE" = {
      instance_type = "t2.micro",
      monitoring    = false
    },
    "PROD" = {
      instance_type = "t2.micro",
      monitoring    = true
    }
  }
}

variable "vpc" {
  type = map(object({ vpc_name = string, vpc_id = string }))
  default = {
    "devops" = {
      vpc_name = "devops"
      vpc_id   = "vpc-0eea19f68d33ab348"
    }
  }
}

variable "subnet_id" {
  default = "subnet-0742f256710a91f52"
}

variable "security_group_id" {
  type = string
  default = ""
}

variable "security_group_name" {
  type = string
  default = "sg_tf_devops"
}

# variable "instance_profile" {
#   default = ""
# }

variable "key_name" {
  default = "ofir-key"
}

variable "ec2_test_key" {
  type        = string
  description = "GitLab assigns the secret var"
}


variable "script_operation" {
  type    = list(string)
  default = ["script.sh", "/tmp/script.sh", "chmod +x /tmp/script.sh", "sudo /tmp/script.sh"]
}


variable "environment_list" {
  type    = list(string)
  default = ["DEV", "QA", "STAGE", "PROD"]
}
