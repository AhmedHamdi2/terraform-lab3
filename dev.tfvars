vpc_cidr="10.0.0.0/16"
public_subnet_cidr="10.0.1.0/24"
private_subnet_cidr="10.0.2.0/24"
env="dev"
ami="ami-04b4f1a9cf54c11d0"
region="us-east-1"
app_count = 1
instance_type = "t2.micro"

list_ec2_configs = [
    {
        name      = "Bastion-1"
        ec2_tier  = "t2.micro"
        ami       = "ami-04b4f1a9cf54c11d0"
    },
    {
        name      = "Bastion-2"
        ec2_tier  = "t2.micro"
        ami       = "ami-04b4f1a9cf54c11d0"
    },
    {
        name      = "Application-1"
        ec2_tier  = "t2.micro"
        ami       = "ami-04b4f1a9cf54c11d0"
    },
    {
        name      = "Application-2"
        ec2_tier  = "t2.micro"
        ami       = "ami-04b4f1a9cf54c11d0"
    }
]


subnet_list = [ 
    {
        name = "Public-1"
        cidr = "10.0.1.0/24"
        type = "public"
    },
    {
        name = "Public-2"
        cidr = "10.0.3.0/24"
        type = "public"
    },

    {
        name = "Private-1"
        cidr = "10.0.2.0/24"
        type = "private"
    },

    {
        name = "Private-2"
        cidr = "10.0.4.0/24"
        type = "private"
    }
]  
