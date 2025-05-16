variable "name" {
  description = "The name for the instance."
  type        = string
  default     = "DemoWebInstance"
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
  default     = "t2.micro"
}

variable "vpc_id" {
  description = "The VPC ID to lunch the instance in."
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID to lunch the instance in."
  type        = string
}
