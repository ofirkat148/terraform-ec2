resource "aws_eks_cluster" "devops_eks" {
  # ... other configuration ...
}




resource "aws_iam_role" "devops_eks" {
  assume_role_policy = data.aws_iam_policy_document.devops_eks_assume_role_policy.json
  name               = "devops_eks"
}
