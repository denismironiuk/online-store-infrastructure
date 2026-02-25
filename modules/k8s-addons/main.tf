# ArgoCD: The GitOps engine for automated deployments
resource "helm_release" "argocd" {
  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = "argocd"
  create_namespace = true
}

# Prometheus Stack: Monitoring and alerting (Observability)
resource "helm_release" "prometheus" {
  name             = "prometheus"
  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "kube-prometheus-stack"
  namespace        = "monitoring"
  create_namespace = true
}

# NGINX Gateway Fabric: Modern Gateway API implementation
resource "helm_release" "nginx_gateway" {
  name             = "nginx-gateway"
  repository       = "https://helm.nginx.com/stable"
  chart            = "nginx-gateway-fabric"
  namespace        = "nginx-gateway"
  create_namespace = true
}

# Cert-Manager: Automatic SSL/TLS certificate management
resource "helm_release" "cert_manager" {
  name             = "cert-manager"
  repository       = "https://charts.jetstack.io"
  chart            = "cert-manager"
  namespace        = "cert-manager"
  create_namespace = true
  set {
    name  = "installCRDs"
    value = "true"
  }
}
