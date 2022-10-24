data "aws_subnets" "subnets" {
  # filter {
  #   name   = var.vpc[var.devops]["vpc_id"]
  #   values = [var.vpc[var.devops]["vpc_name"]]
  # }
}



data "aws_subnet" "subnet" {
  for_each = toset(data.aws_subnets.subnets.ids)
  id       = each.value
}

