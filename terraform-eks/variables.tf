variable "kubernetes_version" {
  default     = 1.27
  description = "kubernetes version"
}

variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "default CIDR range of the VPC"
}
variable "aws_region" {
  default = "eu-west-1"
  description = "aws region"
}

variable "name" {
  default = "neel"
  description = "eks name"
}

variable "github_owner" {
  default     = "Patel177"
  description = "GitHub username or organization"
}

variable "github_repo" {
  default     = "containerized-app-platform"
  description = "GitHub repository name"
}

variable "github_token" {
  description = "GitHub personal access token for Flux"
  type        = string
  sensitive   = true
}
