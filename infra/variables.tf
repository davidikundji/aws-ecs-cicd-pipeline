########################################
# General Project Variables
########################################

variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Name of the project used for resource naming"
  type        = string
  default     = "aws-ecs-cicd-pipeline"
}

variable "container_port" {
  description = "Port used by the Flask application container"
  type        = number
  default     = 3000
}

########################################
# Alerting Variables
########################################

variable "alert_email" {
  description = "Email address for CloudWatch alarm notifications"
  type        = string
  default     = "davidikundji@gmail.com"
}

variable "cpu_alarm_threshold" {
  description = "CPU utilization threshold for CloudWatch alarm"
  type        = number
  default     = 80
}

variable "memory_alarm_threshold" {
  description = "Memory utilization threshold for CloudWatch alarm"
  type        = number
  default     = 80
}

########################################
# ECS Task Variables
########################################

variable "ecs_cpu" {
  description = "CPU units for the ECS task"
  type        = number
  default     = 256
}

variable "ecs_memory" {
  description = "Memory in MiB for the ECS task"
  type        = number
  default     = 512
}

variable "ecs_desired_count" {
  description = "Desired number of ECS tasks"
  type        = number
  default     = 1
}

variable "log_retention_days" {
  description = "CloudWatch log retention in days"
  type        = number
  default     = 7
}

########################################
# ECS Auto Scaling Variables
########################################

variable "ecs_min_capacity" {
  description = "Minimum number of ECS tasks"
  type        = number
  default     = 1
}

variable "ecs_max_capacity" {
  description = "Maximum number of ECS tasks"
  type        = number
  default     = 3
}

variable "cpu_target_value" {
  description = "Target CPU utilization percentage for ECS auto scaling"
  type        = number
  default     = 70
}

variable "memory_target_value" {
  description = "Target memory utilization percentage for ECS auto scaling"
  type        = number
  default     = 75
}

variable "scale_in_cooldown" {
  description = "Cooldown period before scaling in"
  type        = number
  default     = 300
}

variable "scale_out_cooldown" {
  description = "Cooldown period before scaling out"
  type        = number
  default     = 60
}