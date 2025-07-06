variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "container_image" {
  description = "Container image URI"
  type        = string
}

variable "container_port" {
  description = "Container port"
  type        = number
  default     = 8080
}

variable "task_cpu" {
  description = "Task CPU units"
  type        = number
  default     = 2048
}

variable "task_memory" {
  description = "Task memory in MB"
  type        = number
  default     = 4096
}

variable "desired_count" {
  description = "Desired number of tasks"
  type        = number
  default     = 1
}

variable "target_group_arn" {
  description = "Target group ARN for load balancer"
  type        = string
}

variable "assign_public_ip" {
  description = "Assign public IP to ECS tasks"
  type        = bool
  default     = true
}

variable "cpu_architecture" {
  description = "CPU architecture"
  type        = string
  default     = "ARM64"
}

variable "log_retention_days" {
  description = "CloudWatch log retention in days"
  type        = number
  default     = 7
}

variable "deployment_maximum_percent" {
  description = "Maximum percent of tasks to run during deployment"
  type        = number
  default     = 200
}

variable "deployment_minimum_healthy_percent" {
  description = "Minimum percent of healthy tasks during deployment"
  type        = number
  default     = 50
}

variable "environment_variables" {
  description = "Environment variables for the container"
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "lb_listener_dependencies" {
  description = "Load balancer listener dependencies"
  type        = list(string)
  default     = []
}

variable "cluster_name" {
  description = "ECS Cluster Name"
  type        = string
}

variable "container_name" {
  type        = string
  description = "ECS container name"
}

variable "http_listener_arn" {
  type        = string
  description = "ARN of the HTTP listener"
}

variable "https_listener_arn" {
  type = string
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnets IDs for ECS service"
}

variable "security_group_ids" {
  type        = list(string)
  description = "Security groups for ECS service"
}

variable "service_name" {
  type        = string
  description = "ECS service name"
}

variable "task_family" {
  type        = string
  description = "ECS task family name"
}


variable "aws_region" {
  description = "AWS region to deploy resources in"
  type        = string
  default     = "eu-west-2"
}
