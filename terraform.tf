# Configure Terraform version requirements and required providers.
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.97.0"
    }
  }
  required_version = "~> 1.11.4"
}

# Configure the AWS provider with the region specified by a variable
provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Environment = "Dev"
      Project     = "3TierWebApp"
    }
  }
}
