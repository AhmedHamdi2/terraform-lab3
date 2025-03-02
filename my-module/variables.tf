variable vpc_cidr {
    type        = string
    description = "The CIDR block for the VPC"
}

variable env {
    type        = string
    description = "The environment for the resources" 
    default = "dev" 
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
