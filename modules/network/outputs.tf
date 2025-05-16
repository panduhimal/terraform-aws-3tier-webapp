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

output "az" {
  description = "The availability zone where resources is deployed."
  value       = var.az
}

output "public_subnet_id" {
  description = "The ID of the public subnet."
  value       = aws_subnet.public_web.id
}

output "public_subnet_cidr_block" {
  description = "The CIDR block of the public subnet."
  value       = aws_subnet.public_web.id
}

output "igw_id" {
  description = "The ID of the Internet Gateway."
  value       = aws_internet_gateway.igw.id
}

output "public_rt_id" {
  description = "The ID of the Public Subnet Route Table."
  value       = aws_route_table.public_rt.id
}

output "private_subnets_info" {
  description = "Map of private subnet name to ID, CIDR block, and name."
  value = {
    for idx, subnet in aws_subnet.private_subnets :
    var.private_subnets[idx].name => {
      id         = subnet.id
      cidr_block = subnet.cidr_block
      name       = subnet.tags["Name"]
    }
  }
}

output "public_subnet_nacl_id" {
  description = "The ID of the NACL associated with Public Subnet."
  value       = aws_network_acl.public_subnet_nacl.id
}

