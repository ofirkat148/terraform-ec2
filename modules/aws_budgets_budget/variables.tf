variable "budget_ec2" {
  description = "Basic Budget Properties"
  type        = map(any)
  default = {
    name        = "budget-ec2-monthly"
    budget_type = "COST"
    time_unit   = "MONTHLY"
    limit_unit  = "USD"
  }
}

variable limit {
  type        = number
  default     = "300"
  description = "Budget limit"
}


variable time_period_start {
  type        = string
  default     = "2022-10-15_22:22"
  description = "starting time"
}

variable cost_filter {
  type        = list
  description = "which filters to use"
  default = ["Amazon Elastic Compute Cloud - Compute"]
}

variable notification {
  type        = map(any)
  default     = {
    comparison_operator = "GREATER_THAN"
    threshold = 100
    threshold_type = "PERCENTAGE"
    notification_type = "FORECASTED"
    subscriber_email_addresses = ["eladav@rafael.co.il"]
  }
  description = "basic notification properties"
}


variable "budget_s3" {
  description = "Basic Budget Properties"
  type        = map(any)
  default = {
    budget_type = "USAGE"
    limit_unit  = "GB"
    limit_amount = 50
  }
}