variable "project-name" {
    type = string
    description = "would be use as prefix for all services that will be created"
    default = "eks"
}

######################### VPC #######################################

variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}


# Declare variable for private subnet CIDR blocks
variable "private_subnet_cidr_blocks" {
  description = "value of the private subnet CIDR block"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

# Declare variable for public subnet CIDR blocks
variable "public_subnet_cidr_blocks" {
  description = "value of the public subnet CIDR block"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]

}

variable "availability_zones" {
  type        = list(string)
  description = "value of the availability zones"
  default     = ["us-east-1a", "us-east-1b"]
}

#######################################################################
variable "cluster_name"{
  type = string
  default = "my-eks"
}


variable "cluster_version" {
  type = string
  default = "1.30"
}

variable "instance_type" {
  type = list(string)
  default = ["t3.medium"]
}


variable "max_size" {
  type = number
  default = 1
}

variable "min_size" {
  type = number
  default = 1
}

variable "desired_size" {
  type = number
  default = 1
}

variable "disk_size" {
  type = number
  default = 40
}



