module "create_pem" {
    source = "./modules/create_pem"
    key_name = "my_pem"
    key_path = "./keys/my_pem.pem"
}

module "create_ec2" {
    source = "./modules/create_ec2"
    instance_type = "t2.micro"
    pem_key = module.create_pem.pem_key
}