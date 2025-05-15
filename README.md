# 🏗️ AWS 3-Tier Web Application Infrastructure with Terraform

This project provisions a **secure and scalable 3-tier architecture** on **AWS** using **Terraform**. The infrastructure is designed for production-grade workloads, following best practices in cloud architecture, modular IaC, and security.

---

## 📐 Architecture Overview

The infrastructure includes the following layers:

- **VPC & Networking**:

  - Custom VPC with public and private subnets across multiple AZs
  - NAT Gateway for secure internet access from private subnets
  - Internet Gateway for public subnet access

- **Application Tiers**:

  - **Web Tier**: Load Balancer (ALB) + EC2 instances in public subnets
  - **App Tier**: EC2 instances in private subnets
  - **Data Tier**: RDS (PostgreSQL/MySQL) in isolated private subnets

- **Security**:

  - Layered security groups and NACLs
  - IAM roles and instance profiles with least privilege
  - Encryption for RDS and S3 (if used)
  - Systems Manager (SSM) access for secure instance management

- **Other Features (Planned)**:
  - Centralized logging with CloudWatch
  - Monitoring and alerting
  - Auto-scaling groups
  - Secrets management using SSM Parameter Store or AWS Secrets Manager

---

## 🚀 Project Goals

- Build production-ready infrastructure using Terraform
- Apply infrastructure as code principles for repeatability and version control
- Learn and apply AWS best practices for networking, IAM, and security
- Modularize Terraform code for reusability and clarity

---
