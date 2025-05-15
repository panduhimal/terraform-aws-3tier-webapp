variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
}

variable "vpc_name" {
  description = "The name for the VPC."
  type        = string
  default     = "DemoVPC"
}

variable "az" {
  description = "The availability zone to deploy resources."
  type        = string
}
variable "public_subnet_cidr_block" {
  description = "The CIDR block for the Public Subnet."
  type        = string
}

variable "public_subnet_name" {
  description = "The name for the Public subnet."
  type        = string
  default     = "DemoPublicSubnet"
}
