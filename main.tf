terraform {
cloud {
    organization = "Sorenson"
    ## Required for Terraform Enterprise; Defaults to app.terraform.io for HCP Terraform
    hostname = "app.terraform.io"
   workspaces {
    name = "ws-givwttai3tEi22ge"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    null = {
      source = "hashicorp/null"
      version = "3.2.2"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  access_key = var.aws_access_key_id
  secret_key = var.aws_session_token
  token = var.aws_session_token
}
