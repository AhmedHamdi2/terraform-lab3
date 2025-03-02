variable vpc_cidr {
    type        = string
    description = "The CIDR block for the VPC"
}

variable public_subnet_cidr {
    type        = string
    description = "The CIDR block for the public subnet"
}

variable private_subnet_cidr {
    type        = string
    description = "The CIDR block for the private subnet"
  
}

variable env {
    type        = string
    description = "The environment for the resources"  
}

variable ami {
    type        = string
    description = "The AMI ID to use for the instances"
}

variable instance_type {
    type        = string
    description = "The instance type to use for the instances"
}

variable region {
    type        = string
    description = "The region to deploy the resources"
}

variable app_count {
    type        = number
    description = "The number of ec2 servers to deploy"
    default = 1
  
}


variable "list_ec2_configs" {
  description = "List of EC2 instances with their names, types, and AMIs"
  type = list(object({
    name      = string
    ec2_tier  = string
    ami       = string
  }))
}

variable  subnet_list {
    description = "List of subnets"
    type = list(object({
        name = string
        cidr = string
        type = string
    }))
  
}

variable "subnet_config" {
  description = "Configuration for subnets"
  type = map(object({
    cidr_block = string
    az         = string
    type       = string
  }))
  default = {
    "Private-1" = { cidr_block = "10.0.1.0/24", az = "us-east-1a", type = "private" }
    "Private-2" = { cidr_block = "10.0.2.0/24", az = "us-east-1b", type = "private" }
    "Public-1"  = { cidr_block = "10.0.3.0/24", az = "us-east-1a", type = "public" }
    "Public-2"  = { cidr_block = "10.0.4.0/24", az = "us-east-1b", type = "public" }
  }
}
