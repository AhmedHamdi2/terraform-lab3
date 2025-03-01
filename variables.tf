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
