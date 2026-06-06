resource "helm_release" "argocd" {

  name      = "argocd"
  namespace = "argocd"

  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"

  create_namespace = true

  depends_on = [
    aws_eks_node_group.main
  ]
}
