provider "aws" {
 # ACCESS_KEY & SECRET_KEY from your AWS Account
 # must be exported to terminal session 
}

terraform {
 backend "s3" {
   bucket   = "devops-study-bucker"
   key      = "dev/security_group/terraform.tfstate"
   region   = "eu-central-1"
 }
 
}

data "terraform_remote_state" "network" {
 backend = "s3" 
    config = {
   bucket   = "devops-study-bucker"
   key      = "dev/network/terraform.tfstate"
   region   = "eu-central-1"
 }
 
}


resource "aws_security_group" "traffic_rules" {
    name = " Traffic Security Group "
    vpc_id = data.terraform_remote_state.network.outputs.vpc_id

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks  = [var.all_internet]
        }

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks  = [data.terraform_remote_state.network.outputs.vpc_cidr]
        }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks  = [var.all_internet]
    }
    tags = {
    Name = "My Demo Security Group"
    Owner = "Roman Hryshchenko"
    Project = "DevOps Study"
    }
}