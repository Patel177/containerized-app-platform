# Generate SSH key for Flux to access GitHub
resource "tls_private_key" "flux" {
  algorithm   = "ECDSA"
  ecdsa_curve = "P256"
}

# Register the SSH key as a deploy key on GitHub
resource "github_repository_deploy_key" "flux" {
  title      = "Flux deploy key for ${var.name}-2025"
  repository = var.github_repo
  key        = tls_private_key.flux.public_key_openssh
  read_only  = false
}

# Bootstrap Flux on the EKS cluster
resource "flux_bootstrap_git" "main" {
  depends_on = [
    github_repository_deploy_key.flux,
    module.eks
  ]

  path               = "clusters/${var.name}-2025"
  components         = ["source-controller", "kustomize-controller", "helm-controller", "notification-controller"]
  namespace          = "flux-system"
  interval           = "1m"
  embedded_manifests = true
}
