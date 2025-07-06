variable "domain_name" {
  description = "Domain name for Route 53 hosted zone"
  type        = string
}

variable "subdomain" {
  description = "Subdomain name"
  type        = string
  default     = ""
}

variable "create_subdomain" {
  description = "Whether to create a subdomain record"
  type        = bool
  default     = true
}

variable "alb_dns_name" {
  description = "ALB DNS name"
  type        = string
}

variable "alb_zone_id" {
  description = "ALB hosted zone ID (required for ALIAS records)"
  type        = string
  default     = ""
}

variable "ttl" {
  description = "TTL for DNS record"
  type        = number
  default     = 300
}

variable "use_alias_record" {
  description = "Use ALIAS record instead of CNAME"
  type        = bool
  default     = true
}

variable "evaluate_target_health" {
  description = "Evaluate target health for ALIAS record"
  type        = bool
  default     = true
}

variable "environment" {
  description = "Environment name"
  type        = string
}


variable "zone_id" {
  type = string
}