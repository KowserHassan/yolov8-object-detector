variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "public_subnet_ids" {
  description = "Subnet IDs for ALB"
  type        = list(string)
}

variable "security_groups" {
  description = "Security group IDs for ALB"
  type        = list(string)
}

variable "target_port" {
  description = "Target group port"
  type        = number
  default     = 8080
}

variable "target_protocol" {
  description = "Target group protocol"
  type        = string
  default     = "HTTP"
}

variable "health_check_path" {
  description = "Health check path"
  type        = string
  default     = "/"
}

variable "health_check_healthy_threshold" {
  description = "Health check healthy threshold"
  type        = number
  default     = 2
}

variable "health_check_unhealthy_threshold" {
  description = "Health check unhealthy threshold"
  type        = number
  default     = 3
}

variable "health_check_timeout" {
  description = "Health check timeout"
  type        = number
  default     = 40
}

variable "health_check_interval" {
  description = "Health check interval"
  type        = number
  default     = 45
}

variable "health_check_matcher" {
  description = "Health check matcher"
  type        = string
  default     = "200-399"
}

variable "ssl_policy" {
  description = "SSL policy for HTTPS listener"
  type        = string
  default     = "ELBSecurityPolicy-TLS-1-2-2017-01"
}

variable "enable_deletion_protection" {
  description = "Enable deletion protection for ALB"
  type        = bool
  default     = false
}

variable "alb_name" {
  description = "Name for the Application Load Balancer"
  type        = string
}

variable "target_group_name" {
  description = "Name for the target group"
  type        = string
}

variable "certificate_arn" {
  type        = string
  description = "ACM certificate ARN for HTTPS listener"
}

