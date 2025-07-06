output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.app_vpc.id
}

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = [for subnet in aws_subnet.app_public_subnet : subnet.id]
}

output "internet_gateway_id" {
  description = "Internet Gateway ID"
  value       = aws_internet_gateway.app_igw.id
}

output "subnet_ids" {
  value = aws_subnet.app_public_subnet
}
