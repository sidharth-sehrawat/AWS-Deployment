terraform {
  required_version = ">=1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>6.0"
    }
    tls = {
      source = "hashicorp/tls"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.37"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "~> 3.0"
    }

  }
}
