module "network" {
    source = "./my-module"
    vpc_cidr = var.vpc_cidr
    env= var.env
    subnet_list = var.subnet_list

}