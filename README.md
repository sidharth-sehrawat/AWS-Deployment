# Pipelines

This project consists of two independent pipelines.

---

# 1. Infrastructure Pipeline

Repository:

```text
AWS-Deployment
```

Purpose:

Provision and manage AWS infrastructure using Terraform.

Flow:

```text
Developer
    |
    | Push Terraform Changes (make any changes in the tf folder to act as a trigger)
    v

AWS-Deployment Repository
    |
    v

GitHub Actions
    |
    v

Terraform Init
    |
    v

Terraform Plan
    |
    v
Review Plan (Manual Apply , Env- Prod)
    |
    v
Terraform Apply
    |
    v

AWS Infrastructure
```

Resources Provisioned:

```text
VPC
Subnets
Route Tables
Internet Gateway
NAT Gateway

IAM Roles
IAM Policies

Amazon ECR

Amazon EKS
Managed Node Groups

OIDC Provider
IRSA

AWS Load Balancer Controller

ArgoCD
```

Infrastructure Source:

```text
terraform/bootstrap/
terraform/environments/dev/
```

---

# 2. Application Deployment Pipeline

Application Source Repository:

```text
super-mario-mimic
```

Purpose:

Build and release application containers.

Flow:

```text
Developer
    |
    | Push Application Code
    v

super-mario-mimic
    |
    v

GitHub Actions
    |
    v

Docker Build
    |
    v

Amazon ECR
    |
    v

Update deployment.yaml
in AWS-Deployment Repository
```

---

# 3. GitOps Deployment Pipeline

Repository:

```text
AWS-Deployment
```

Purpose:

Deploy workloads into EKS.

Flow:

```text
AWS-Deployment
    |
    | Manifest Change
    v

ArgoCD
    |
    v

Amazon EKS
    |
    v

Rolling Update
    |
    v

Application Pods
```

ArgoCD watches:

```text
apps/mario/
```

Application definition:

```text
argocd/mario-app.yaml
```

---

# Complete End-to-End Flow

```text
INFRASTRUCTURE PIPELINE

AWS-Deployment
      |
      v
GitHub Actions
      |
      v
Terraform
      |
      v
AWS Infrastructure
      |
      v
EKS + ArgoCD


APPLICATION PIPELINE

super-mario-mimic
      |
      v
GitHub Actions
      |
      v
Docker Build
      |
      v
Amazon ECR
      |
      v
Update deployment.yaml
      |
      v
AWS-Deployment


GITOPS PIPELINE

AWS-Deployment
      |
      v
ArgoCD
      |
      v
Amazon EKS
      |
      v
Running Application
```
