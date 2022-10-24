resource "aws_budgets_budget" "ec2" {
  name              = var.budget_ec2["name"]
  budget_type       = var.budget_ec2["budget_type"]
  limit_amount      = var.limit
  limit_unit        = var.budget_ec2["limit_unit"]
  
  time_period_start = var.time_period_start
  time_unit         = var.budget_ec2["time_unit"]

  cost_filter {
    name = "Service"
    values = var.cost_filter
  }

  notification {
    comparison_operator        = var.notification["comparison_operator"]
    threshold                  = var.notification["threshold"]
    threshold_type             = var.notification["threshold_type"]
    notification_type          = var.notification["notification_type"]
    subscriber_email_addresses = var.notification["subscriber_email_addresses"]
  }
}