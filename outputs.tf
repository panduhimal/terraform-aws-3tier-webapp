output "vpc_id" {
  description = "The ID of the VPC."
  value       = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC."
  value       = module.vpc.vpc_cidr_block
}

output "vpc_default_route_table_id" {
  description = "The ID of the default route table associated with the VPC."
  value       = module.vpc.vpc_default_route_table_id
}

output "az" {
  description = "The availability zone where resources is deployed."
  value       = module.vpc.az
}

output "public_subnet_id" {
  description = "The ID of the public subnet."
  value       = module.vpc.public_subnet_id
}

output "public_subnet_cidr_block" {
  description = "The CIDR block of the public subnet."
  value       = module.vpc.public_subnet_cidr_block
}

output "igw_id" {
  description = "The ID of the Internet Gateway."
  value       = module.vpc.igw_id
}

output "public_rt_id" {
  description = "The ID of the Public Subnet Route Table."
  value       = module.vpc.public_rt_id
}

output "private_subnets_info" {
  description = "Private subnet info from network module."
  value       = module.vpc.private_subnets_info
}

output "public_subnet_nacl_id" {
  description = "The ID of the NACL associated with Public Subnet."
  value       = module.vpc.public_subnet_nacl_id
}
