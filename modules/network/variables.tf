#################################################################
            #Take variables from Terragrunt inputs
#################################################################
variable "profile"{}
variable "region"{}
variable "env" {}
variable "owner" {}
variable "project" {}
variable "app_name" {}

################################################################
            # Variables from Terragrunt for currient module
################################################################
variable "vpc_cidr" {}
variable "az_count" {}

################################################################
            # Variables for security_group
################################################################
variable "app_port" {}        
