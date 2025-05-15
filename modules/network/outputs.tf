output "vpc_id" {
  description = "The ID of the VPC."
  value       = aws_vpc.main.id
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC."
  value       = aws_vpc.main.cidr_block
}

output "vpc_default_route_table_id" {
  description = "The ID of the default route table associated with the VPC."
  value       = aws_vpc.main.default_route_table_id
}
