resource "aws_budgets_budget" "s3" {
  budget_type  = var.budget_s3["budget_type"]
  limit_amount = var.budget_s3["limit_amount"]
  limit_unit   = var.budget_s3["limit_unit"]
}
