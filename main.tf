terraform {
  required_version = ">= 0.13.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 2.0"
    }
  }

}

provider "aws" {
  region = "us-east-1"
}

locals {
  general_vpc = {
    azs = ["us-east-1a", "us-east-1b", "us-east-1c"]
  }

  vpc = {
    name = "vpc-smm"
    cidr = "192.168.0.0/20"
    subnets = {
      private = ["192.168.0.0/23", "192.168.2.0/25", "192.168.2.128/26"]
      public  = ["192.168.2.192/27"]
    }
  }
}