variable "owner" {
  type        = string
  default     = "Roman Hryshchenko"
  description = "OWNER"
}

variable "project" {
  type        = string
  default     = "DevOps Study"
  description = "Project Name"
}
variable "env" {
  type        = string
  default     = "dev-demo"
  description = "enviroment variable"
}

variable "app_name" {
  type        = string
  default     = "Site on Apache"
  description = "description"
}


variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "VPC_CIDRs_Block"
}

variable "az_count" {
    type        = string
    default     = "2"
    description = "Number of Availablity Zones to cover in a given region"
}

