variable "region" {
  description = "The AWS region to deploy resources into."
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "az" {
  description = "The availability zone to deploy resources."
  type        = string
  default     = "us-east-1a"
}
variable "public_subnet_cidr_block" {
  description = "The CIDR block for the Public Subnet."
  type        = string
  default     = "10.0.0.0/24"
}
