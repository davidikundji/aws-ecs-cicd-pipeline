# AWS ECS CI/CD Pipeline using GitHub Actions, Docker, Terraform & Amazon ECS Fargate

```{=html}
<p align="center">
```
![AWS](https://img.shields.io/badge/AWS-Cloud-orange?logo=amazonaws)
![Terraform](https://img.shields.io/badge/Terraform-IaC-623CE4?logo=terraform)
![Docker](https://img.shields.io/badge/Docker-Containerization-2496ED?logo=docker)
![GitHub
Actions](https://img.shields.io/badge/GitHub_Actions-CI/CD-2088FF?logo=githubactions)
![Python](https://img.shields.io/badge/Python-Flask-3776AB?logo=python)
![Amazon
ECS](https://img.shields.io/badge/Amazon-ECS_Fargate-FF9900?logo=amazonaws)

```{=html}
</p>
```

------------------------------------------------------------------------

# Project Overview

This project demonstrates a production-style Continuous Integration and
Continuous Deployment (CI/CD) pipeline on AWS using Terraform, Docker,
GitHub Actions, Amazon ECR, and Amazon ECS Fargate.

Every push to the **main** branch automatically:

-   Builds a Docker image
-   Pushes the image to Amazon ECR
-   Updates the ECS Task Definition
-   Deploys the latest version to Amazon ECS Fargate
-   Verifies deployment through the ECS Service

Infrastructure is provisioned entirely with Terraform and includes
secure networking, an Application Load Balancer, CloudWatch monitoring,
Amazon SNS notifications, and ECS Service Auto Scaling.

------------------------------------------------------------------------

# Features

-   Infrastructure as Code using Terraform
-   Dockerized Flask application
-   GitHub Actions CI/CD
-   Amazon ECS Fargate
-   Amazon ECR
-   Application Load Balancer
-   CloudWatch Logs & Container Insights
-   CloudWatch Alarms
-   Amazon SNS Notifications
-   ECS Auto Scaling
-   Secure VPC Networking
-   GitHub Secrets

------------------------------------------------------------------------

# Project Statistics

-   AWS Services Used: 12+
-   Terraform Files: 10+
-   CI/CD Workflow: GitHub Actions
-   Deployment: Fully Automated
-   Monitoring: CloudWatch + SNS
-   Compute: Amazon ECS Fargate

------------------------------------------------------------------------

# Live Deployment

Example output after deployment:

    Hello from CI/CD Pipeline Version 2!

------------------------------------------------------------------------

# AWS Architecture

![AWS Architecture](screenshots/architecture.png)

------------------------------------------------------------------------

# Technologies Used

## AWS

-   Amazon ECS (Fargate)
-   Amazon ECR
-   VPC
-   Public & Private Subnets
-   Internet Gateway
-   NAT Gateway
-   Application Load Balancer
-   CloudWatch
-   Amazon SNS
-   IAM

## DevOps

-   GitHub
-   GitHub Actions
-   Docker

## Infrastructure as Code

-   Terraform

## Programming

-   Python
-   Flask

------------------------------------------------------------------------

# Repository Structure

``` text
aws-ecs-cicd-pipeline/
├── .github/workflows/deploy.yml
├── app/
├── infra/
├── screenshots/
├── README.md
└── .gitignore
```

------------------------------------------------------------------------

# CI/CD Workflow

Developer → GitHub → GitHub Actions → Docker Build → Amazon ECR → ECS
Task Definition → Amazon ECS Fargate → Application Load Balancer

------------------------------------------------------------------------

# Infrastructure Overview

Terraform provisions:

-   Amazon VPC
-   Public & Private Subnets
-   NAT Gateway
-   Security Groups
-   Application Load Balancer
-   Amazon ECS Cluster
-   Amazon ECS Service
-   Amazon ECR
-   CloudWatch
-   Amazon SNS

------------------------------------------------------------------------

# Security

-   IAM Roles
-   Least Privilege
-   Private ECS Tasks
-   Public ALB
-   GitHub Secrets
-   Security Groups
-   Deployment Circuit Breaker

------------------------------------------------------------------------

# Monitoring & Auto Scaling

CloudWatch monitors CPU, memory, logs, and Container Insights.

Amazon SNS sends email notifications.

ECS Service Auto Scaling automatically scales between **1--3 tasks**
based on CPU and memory utilization.

------------------------------------------------------------------------

# Project Screenshots

## Infrastructure

  ---------------------------------------------------------------------------
  AWS Architecture                    Terraform Deployment
  ----------------------------------- ---------------------------------------
  ![](screenshots/architecture.png)   ![](screenshots/terraform-apply.png)

  ---------------------------------------------------------------------------

## CI/CD

  GitHub Actions                        Amazon ECR
  ------------------------------------- --------------------------
  ![](screenshots/github-actions.png)   ![](screenshots/ecr.png)

## Amazon ECS

  ECS Cluster                        ECS Service
  ---------------------------------- ----------------------------------
  ![](screenshots/ecs-cluster.png)   ![](screenshots/ecs-service.png)

  ECS Task                        Auto Scaling
  ------------------------------- ----------------------------------
  ![](screenshots/ecs-task.png)   ![](screenshots/autoscaling.png)

## Monitoring

  -----------------------------------------------------------------------------------
  CloudWatch Dashboard                        CloudWatch Alarms
  ------------------------------------------- ---------------------------------------
  ![](screenshots/cloudwatch-dashboard.png)   ![](screenshots/cloudwatch-alarm.png)

  -----------------------------------------------------------------------------------

  SNS
  --------------------------
  ![](screenshots/sns.png)

## Application

  Load Balancer              Running Application
  -------------------------- ----------------------------------
  ![](screenshots/alb.png)   ![](screenshots/application.png)

------------------------------------------------------------------------

# Deployment Verification

The application was updated from:

    Hello from CI/CD Pipeline!

to

    Hello from CI/CD Pipeline Version 2!

A push to the **main** branch automatically triggered the GitHub Actions
workflow, built a new Docker image, pushed it to Amazon ECR, updated the
ECS task definition, deployed a new revision to ECS, and served the
updated application through the Application Load Balancer without manual
intervention.

------------------------------------------------------------------------

# Skills Demonstrated

-   AWS Cloud Engineering
-   Terraform
-   Docker
-   GitHub Actions
-   Amazon ECS
-   Amazon ECR
-   IAM
-   CloudWatch
-   Amazon SNS
-   Auto Scaling
-   Infrastructure as Code
-   CI/CD Automation

------------------------------------------------------------------------

# Lessons Learned

This project strengthened my understanding of Infrastructure as Code,
containerization, automated deployments, secure cloud networking,
monitoring, and scalable application deployment using AWS services and
DevOps best practices.

------------------------------------------------------------------------

# Challenges Encountered

-   Configuring ECS IAM roles
-   Authenticating Docker with Amazon ECR
-   Designing secure ECS networking
-   Automating deployments with GitHub Actions

Resolving these issues improved my troubleshooting skills and deepened
my understanding of AWS architecture.

------------------------------------------------------------------------

# Future Improvements

-   Blue/Green deployments
-   AWS Secrets Manager
-   HTTPS with ACM
-   Route 53 custom domain
-   AWS WAF
-   AWS X-Ray
-   Remote Terraform state
-   Automated testing

------------------------------------------------------------------------

# Conclusion

This project demonstrates a complete cloud-native deployment platform
built with Terraform, Docker, GitHub Actions, Amazon ECR, and Amazon ECS
Fargate. It showcases practical experience with Infrastructure as Code,
CI/CD automation, monitoring, scaling, and secure AWS architecture.

------------------------------------------------------------------------

# Author

## David Ikundji

**AWS Cloud Engineer \| M.S. Computer Science (AI & Machine Learning) \|
DevOps Engineer**

-   GitHub: https://github.com/davidikundji
-   LinkedIn: https://www.linkedin.com/in/davidikundji/
