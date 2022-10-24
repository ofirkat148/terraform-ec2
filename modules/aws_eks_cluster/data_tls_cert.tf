data "tls_certificate" "devops_eks" {
  url = aws_eks_cluster.devops_eks.identity[0].oidc[0].issuer
}
