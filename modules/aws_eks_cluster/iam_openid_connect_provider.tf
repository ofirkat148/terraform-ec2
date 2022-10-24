resource "aws_iam_openid_connect_provider" "devops_eks" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.devops_eks.certificates[0].sha1_fingerprint]
  url             = aws_eks_cluster.devops_eks.identity[0].oidc[0].issuer
}