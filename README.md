# AWS CI/CD Pipeline with GitHub Actions, Docker & Amazon ECS Fargate

![AWS](https://img.shields.io/badge/AWS-Cloud-orange?logo=amazonaws)
![Terraform](https://img.shields.io/badge/Terraform-IaC-623CE4?logo=terraform)
![Docker](https://img.shields.io/badge/Docker-Containerization-2496ED?logo=docker)
![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-CI/CD-2088FF?logo=githubactions)
![Python](https://img.shields.io/badge/Python-Flask-3776AB?logo=python)
![Amazon ECS](https://img.shields.io/badge/Amazon-ECS_Fargate-FF9900?logo=amazonaws)

---

## Table of Contents

* [Project Overview](#project-overview)
* [Project Highlights](#project-highlights)
* [AWS Architecture](#aws-architecture)
* [Solution Architecture](#solution-architecture)
* [Technologies Used](#technologies-used)
* [Repository Structure](#repository-structure)
* [CI/CD Pipeline Workflow](#cicd-pipeline-workflow)
* [Infrastructure Overview](#infrastructure-overview)
* [Security](#security)
* [Monitoring and Auto Scaling](#monitoring-and-auto-scaling)
* [Project Screenshots](#project-screenshots)
* [Skills Demonstrated](#skills-demonstrated)
* [Lessons Learned](#lessons-learned)
* [Challenges Encountered](#challenges-encountered)
* [Future Improvements](#future-improvements)
* [Project Outcome](#project-outcome)
* [Conclusion](#conclusion)
* [Author](#author)

---

## Project Overview

This project demonstrates the implementation of a complete Continuous Integration and Continuous Deployment pipeline using GitHub Actions, Docker, Terraform, Amazon ECR, and Amazon ECS Fargate.

The goal of this project was to build a production-style deployment workflow where every code change pushed to the `main` branch automatically triggers a deployment pipeline. The pipeline builds a Docker image for a Python Flask application, pushes the image to Amazon Elastic Container Registry, updates the Amazon ECS task definition, and deploys the latest version to Amazon ECS Fargate.

The infrastructure was provisioned entirely using Terraform. This includes the VPC, public and private subnets, Internet Gateway, NAT Gateway, route tables, security groups, Amazon ECR repository, ECS cluster, ECS task definition, ECS service, Application Load Balancer, CloudWatch monitoring, SNS notifications, and ECS Auto Scaling.

This project demonstrates hands-on experience with cloud infrastructure, DevOps automation, containerization, Infrastructure as Code, CI/CD pipelines, cloud networking, monitoring, and scalable AWS application deployment.

---

## Project Highlights

* Fully automated CI/CD pipeline using GitHub Actions
* Dockerized Python Flask application
* Infrastructure provisioned with Terraform
* Amazon ECS Fargate serverless container deployment
* Amazon ECR container image repository
* Application Load Balancer for public access
* ECS tasks deployed in private subnets
* NAT Gateway for outbound internet access
* CloudWatch Logs and Container Insights
* CloudWatch CPU and Memory alarms
* Amazon SNS email notifications
* ECS Service Auto Scaling
* Deployment Circuit Breaker
* GitHub Secrets for secure AWS authentication
* Zero manual deployments after code changes

---

## AWS Architecture

![AWS Architecture](screenshots/architecture.png)

---

## Solution Architecture

The application runs as a Docker container on Amazon ECS Fargate. The ECS tasks are deployed inside private subnets for security, while an internet-facing Application Load Balancer is deployed in public subnets to route traffic to the application.

GitHub Actions is responsible for the CI/CD automation. Whenever code is pushed to the `main` branch, GitHub Actions builds a new Docker image, pushes it to Amazon ECR, updates the ECS task definition, and deploys the new application version to ECS.

CloudWatch provides logging, metrics, alarms, and Container Insights. Amazon SNS sends email alerts when CloudWatch alarms are triggered. ECS Auto Scaling adjusts the number of running tasks based on CPU and memory utilization.

---

## Technologies Used

### AWS Services

* Amazon ECS Fargate
* Amazon Elastic Container Registry
* Amazon VPC
* Application Load Balancer
* Internet Gateway
* NAT Gateway
* Public Subnets
* Private Subnets
* Route Tables
* Security Groups
* Amazon CloudWatch
* CloudWatch Container Insights
* CloudWatch Alarms
* Amazon SNS
* IAM Roles and Policies

### DevOps Tools

* GitHub
* GitHub Actions
* Docker
* Terraform

### Programming

* Python
* Flask

---

## Repository Structure

```text
aws-ecs-cicd-pipeline/
│
├── .github/
│   └── workflows/
│       └── deploy.yml
│
├── app/
│   ├── app.py
│   ├── Dockerfile
│   ├── requirements.txt
│   └── .dockerignore
│
├── infra/
│   ├── provider.tf
│   ├── networking.tf
│   ├── security.tf
│   ├── iam.tf
│   ├── ecr.tf
│   ├── ecs.tf
│   ├── alb.tf
│   ├── autoscaling.tf
│   ├── monitoring.tf
│   ├── outputs.tf
│   ├── variables.tf
│   └── terraform.tfvars
│
├── screenshots/
│   ├── architecture.png
│   ├── github-actions.png
│   ├── ecr.png
│   ├── ecs-cluster.png
│   ├── ecs-service.png
│   ├── ecs-task.png
│   ├── alb.png
│   ├── cloudwatch-dashboard.png
│   ├── cloudwatch-alarm.png
│   ├── sns.png
│   ├── autoscaling.png
│   └── application.png
│
├── README.md
└── .gitignore
```

---

## CI/CD Pipeline Workflow

Every push to the `main` branch automatically triggers the GitHub Actions workflow.

The pipeline performs the following steps:

1. Checks out the GitHub repository.
2. Configures AWS credentials using GitHub Secrets.
3. Logs in to Amazon ECR.
4. Builds a Docker image from the Flask application.
5. Tags the Docker image using the Git commit SHA.
6. Pushes the Docker image to Amazon ECR.
7. Downloads the current ECS task definition.
8. Updates the task definition with the new Docker image.
9. Deploys the new task definition to Amazon ECS.
10. Waits for the ECS service to stabilize.
11. The Application Load Balancer routes traffic to the updated application.

```text
Developer
   |
   | git push origin main
   v
GitHub Repository
   |
   v
GitHub Actions
   |
   v
Build Docker Image
   |
   v
Push Image to Amazon ECR
   |
   v
Update ECS Task Definition
   |
   v
Deploy to Amazon ECS Fargate
   |
   v
Application Load Balancer
   |
   v
Python Flask Application
```

---

## Infrastructure Overview

Terraform provisions the complete AWS infrastructure for this project.

### Networking

* VPC
* Two public subnets
* Two private subnets
* Internet Gateway
* NAT Gateway
* Route Tables
* Security Groups

### Compute

* ECS Cluster
* ECS Service
* ECS Task Definition
* ECS Fargate tasks

### Container Registry

* Amazon ECR repository

### Load Balancing

* Application Load Balancer
* Target Group
* Health Checks

### Monitoring

* CloudWatch Logs
* CloudWatch Container Insights
* CloudWatch Alarms
* Amazon SNS notifications

### Scaling

* ECS Service Auto Scaling
* CPU target tracking policy
* Memory target tracking policy

---

## Security

Security was built into the architecture by separating public and private resources.

The Application Load Balancer is deployed in public subnets and is the only resource that receives inbound traffic from the internet. ECS tasks are deployed in private subnets and do not have public IP addresses.

Security Groups restrict traffic so that ECS tasks only receive traffic from the Application Load Balancer.

GitHub Secrets are used to store AWS credentials securely for the CI/CD workflow.

Implemented security features include:

* Private subnets for ECS tasks
* Public subnets for the Application Load Balancer
* Security Groups with least-privilege access
* IAM roles for ECS task execution
* GitHub Secrets for AWS authentication
* Deployment Circuit Breaker for safer ECS deployments
* NAT Gateway for controlled outbound internet access

---

## Monitoring and Auto Scaling

CloudWatch was configured to provide visibility into the ECS service and running containers.

Monitoring features include:

* CloudWatch Logs
* CloudWatch Container Insights
* CPU utilization metrics
* Memory utilization metrics
* CloudWatch alarms
* Amazon SNS email notifications

ECS Auto Scaling was configured to adjust the number of running tasks based on CPU and memory utilization.

Scaling configuration includes:

* Minimum task count: 1
* Maximum task count: 3
* CPU target tracking
* Memory target tracking
* Scale-in cooldown
* Scale-out cooldown

This allows the application to respond automatically to workload changes while maintaining cost control.

---

## Project Screenshots

### AWS Architecture

![AWS Architecture](screenshots/architecture.png)

---

### GitHub Actions Workflow

![GitHub Actions Workflow](screenshots/github-actions.png)

---

### Amazon ECR Repository

![Amazon ECR Repository](screenshots/ecr.png)

---

### Amazon ECS Cluster

![Amazon ECS Cluster](screenshots/ecs-cluster.png)

---

### Amazon ECS Service

![Amazon ECS Service](screenshots/ecs-service.png)

---

### Amazon ECS Task

![Amazon ECS Task](screenshots/ecs-task.png)

---

### Application Load Balancer

![Application Load Balancer](screenshots/alb.png)

---

### CloudWatch Dashboard

![CloudWatch Dashboard](screenshots/cloudwatch-dashboard.png)

---

### CloudWatch Alarm

![CloudWatch Alarm](screenshots/cloudwatch-alarm.png)

---

### Amazon SNS Notification

![Amazon SNS Notification](screenshots/sns.png)

---

### ECS Auto Scaling

![ECS Auto Scaling](screenshots/autoscaling.png)

---

### Running Application

![Running Application](screenshots/application.png)

---

## Skills Demonstrated

This project demonstrates practical experience with:

* AWS Cloud Architecture
* Infrastructure as Code
* Terraform
* Docker Containerization
* Amazon ECS Fargate
* Amazon ECR
* GitHub Actions
* CI/CD Automation
* Application Load Balancing
* VPC Networking
* Public and Private Subnets
* NAT Gateway
* IAM Roles and Policies
* CloudWatch Monitoring
* CloudWatch Alarms
* SNS Notifications
* ECS Auto Scaling
* Deployment Automation
* DevOps Best Practices

---

## Lessons Learned

This project provided hands-on experience building a complete cloud-native CI/CD pipeline using AWS and modern DevOps tools.

The project reinforced the importance of Infrastructure as Code for creating repeatable and consistent cloud environments. Terraform made it possible to define and manage the entire AWS infrastructure in code.

Docker containerization made the application portable and consistent across local development and AWS deployment environments.

GitHub Actions automated the deployment process and removed the need for manual Docker builds, image pushes, and ECS deployments.

Amazon ECS Fargate simplified container orchestration by removing the need to manage EC2 instances.

CloudWatch monitoring, SNS notifications, and ECS Auto Scaling demonstrated the importance of observability, alerting, and scalability in production-style cloud environments.

---

## Challenges Encountered

Several challenges were encountered and resolved during this project.

### IAM Roles

ECS required both an ECS Task Execution Role and an ECS Task Role. The execution role allows ECS to pull images from Amazon ECR and send logs to CloudWatch. The task role provides permissions to the running container and was required for ECS Exec.

### Amazon ECR Authentication

Docker authentication with Amazon ECR required troubleshooting AWS CLI authentication and Docker login behavior. The issue was resolved by verifying the ECR repository, confirming AWS credentials, refreshing the ECR login token, and successfully authenticating Docker to Amazon ECR.

### ECS Networking

Deploying ECS tasks in private subnets required configuring a NAT Gateway and correct route tables so the tasks could pull images from ECR and send logs to CloudWatch while remaining inaccessible directly from the internet.

### GitHub Actions Deployment

The GitHub Actions workflow required securely storing AWS credentials in GitHub Secrets, building the Docker image, pushing it to ECR, updating the ECS task definition, and waiting for the ECS service deployment to stabilize.

These challenges improved my understanding of AWS networking, IAM, ECS, Docker, GitHub Actions, and cloud troubleshooting.

---

## Future Improvements

Future improvements for this project include:

* Add automated unit tests before deployment.
* Implement Blue/Green deployments.
* Add Canary deployment strategy.
* Configure HTTPS using AWS Certificate Manager.
* Add Route 53 custom domain name.
* Store application secrets in AWS Secrets Manager.
* Add AWS WAF for application protection.
* Configure AWS X-Ray for distributed tracing.
* Use Terraform remote state with Amazon S3 and DynamoDB locking.
* Add cost monitoring dashboards.
* Add vulnerability scanning before deployment.
* Add Slack or Microsoft Teams notifications for deployment status.

---

## Project Outcome

The completed solution delivers a fully automated deployment pipeline.

Every push to the `main` branch automatically triggers GitHub Actions to build a new Docker image, push it to Amazon ECR, update the ECS task definition, and deploy the latest application version to Amazon ECS Fargate.

The final result is a scalable, secure, monitored, and automated AWS deployment platform that follows modern DevOps and cloud engineering best practices.

The application was successfully updated from:

```text
Hello from CI/CD Pipeline!
```

to:

```text
Hello from CI/CD Pipeline Version 2!
```

using only a Git push, proving that the CI/CD pipeline works end to end.

---

## Conclusion

This project demonstrates the successful implementation of a production-style CI/CD pipeline using GitHub Actions, Docker, Terraform, Amazon ECR, and Amazon ECS Fargate.

By combining Infrastructure as Code, containerization, automated deployments, cloud monitoring, Auto Scaling, and secure networking, this project provides a complete example of modern cloud-native application delivery on AWS.

The project showcases practical AWS Cloud Engineering and DevOps skills, including infrastructure automation, container orchestration, CI/CD pipeline design, monitoring, security, and scalability.

---

## Author

**David Ikundji**
AWS Cloud & DevOps Engineer

GitHub: https://github.com/davidikundji
