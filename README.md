🚀 AWS Serverless Architecture Project
✅ A Fully Modular, Terraform‑Driven Deployment
🗺️ Architecture Diagram

                           🌐 Users
                             |
                      [CloudFront CDN]
                             |
                           [S3]
                             |
                      [API Gateway]
                             |
                           [Lambda]
                             |
              +-----------------------------+
              |                             |
           [Aurora Serverless v2]       [DynamoDB (Sessions)]
              |
           [RDS Cluster]

Authentication:
    [Cognito User Pool + Client]

Observability:
    [CloudWatch Logs & Metrics | X‑Ray Tracing]

Deployment:
    ✅ Infrastructure as Code (Terraform)  
    ✅ CI/CD via GitHub Actions  
    ✅ Remote State Management (S3 + DynamoDB)

Security:
    🔐 IAM Roles (least privilege)  
    🔥 AWS WAF Protection  
    🔑 AWS KMS Encryption
⚡️ Features
✅ Modularized Terraform:

modules/s3_cloudfront ➔ S3 + CDN

modules/lambda_apigw ➔ API Gateway + Lambda

modules/dynamodb ➔ Session Store

modules/aurora ➔ RDS Aurora Cluster

modules/cognito ➔ User Pool + Client

✅ Architecture:

☁️ Aurora Serverless v2 for relational workloads.

⚡️ DynamoDB for caching and session storage.

🌍 S3 + CloudFront for highly available, global static site hosting.

🚀 Lambda + API Gateway for fully managed, event‑driven APIs.

🔐 Cognito for user identity and access.

🔥 KMS and WAF for enhanced security.

✅ Deployment & IaC:

👇 PR triggers terraform plan.

✅ Merge PR triggers terraform apply.

🛠 Main branch protected with review policies.

🔐 State managed securely via S3 + DynamoDB.

♻️ terraform destroy available via manual workflow dispatch.

⚡️ Improvements Done
Created a one‑click deployment for an enterprise‑level app.

Modularized the setup for clean, maintainable infrastructure.

Updated CloudFront configuration to include required forwarded_values.

Created GitHub Actions pipelines:

PR ➔ terraform plan.

Main ➔ terraform apply.

Created terraform destroy workflow for clean teardown.

⚡️ Getting Started

✅ 1️⃣ Clone the Repo
git clone https://github.com/<yourusername>/aws-serverless-platform-infra.git
cd aws-serverless-platform-infra

✅ 2️⃣ Configure State (backend.tf)

terraform {
  backend "s3" {
    bucket         = "terraform-state"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "sysco-terraform-lock"
    encrypt        = true
  }
}
✅ 3️⃣ Apply Locally

terraform init
terraform apply
✅ 4️⃣ Push to Main
Push changes ➔ PR ➔ terraform plan

Merge PR ➔ Main ➔ terraform apply

🌍 Real‑World Architecture (Enterprise‑Grade).

🏗️ Follows AWS best practices (least privilege, managed services).

✅ Enables true GitOps — making it ideal for SaaS, startups, or enterprise deployments.
