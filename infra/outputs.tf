########################################
# Load Balancer
########################################

output "load_balancer_dns" {
  description = "Application Load Balancer DNS Name"
  value       = aws_lb.app.dns_name
}

########################################
# ECR Repository
########################################

output "ecr_repository_url" {
  description = "Amazon ECR Repository URL"
  value       = aws_ecr_repository.app.repository_url
}

########################################
# ECS Cluster
########################################

output "ecs_cluster_name" {
  description = "ECS Cluster Name"
  value       = aws_ecs_cluster.main.name
}

########################################
# ECS Service
########################################

output "ecs_service_name" {
  description = "ECS Service Name"
  value       = aws_ecs_service.app.name
}

########################################
# ECS Task Definition
########################################

output "ecs_task_definition" {
  description = "ECS Task Definition Family"
  value       = aws_ecs_task_definition.app.family
}

########################################
# CloudWatch Log Group
########################################

output "cloudwatch_log_group" {
  description = "CloudWatch Log Group"
  value       = aws_cloudwatch_log_group.ecs_logs.name
}

########################################
# SNS Topic
########################################

output "sns_topic_arn" {
  description = "SNS Topic ARN"
  value       = aws_sns_topic.alerts.arn
}

########################################
# VPC
########################################

output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

########################################
# Public Subnets
########################################

output "public_subnets" {
  description = "Public Subnet IDs"
  value = [
    aws_subnet.public_1.id,
    aws_subnet.public_2.id
  ]
}

########################################
# Private Subnets
########################################

output "private_subnets" {
  description = "Private Subnet IDs"
  value = [
    aws_subnet.private_1.id,
    aws_subnet.private_2.id
  ]
}