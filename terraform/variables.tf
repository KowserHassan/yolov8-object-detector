variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "ai-app2"
}

variable "vpc_name" {
  description = "vpc name"
  type        = string
}

variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

# variable "certificate_arn" {
#   description = "ACM certificate ARN"
#   type        = string
# }


variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "availability_zones" {
  description = "Availability zones"
  type        = list(string)
  default     = ["eu-west-2a", "eu-west-2b"]
}

variable "ecs_cluster_name" {
  description = "ECS cluster name"
  type        = string
  default     = "app_ecs"
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

variable "domain_name" {
  description = "Domain name"
  type        = string
  default     = "kowserhassan.com"
}

variable "subdomain" {
  description = "Subdomain"
  type        = string
  default     = "ai.dojo"
}

variable "health_check_path" {
  description = "Health check path"
  type        = string
  default     = "/"
}

variable "sg_name" {
  description = "Security group name"
  type        = string
}

variable "alb_name" {
  description = "Name for the Application Load Balancer"
  type        = string
  default     = "default-alb-name"
}

variable "target_group_name" {
  description = "Name for the target group"
  type        = string
  default     = "default-target-group"
}

variable "service_name" {
  type        = string
  description = "ECS service name"
}

variable "task_family" {
  type        = string
  description = "ECS task family name"
}

variable "container_name" {
  type        = string
  description = "ECS container name"
}

variable "execution_role" {
  description = "ECS execution role name"
  type        = string
  default     = "ecsTaskExecutionRole"
}

variable "dns_hosted_zone" {
  description = "Hosted zone domain"
  type        = string
  default     = "kowser.co.uk"  
}

variable "zone_id" {
  type = string
}
