module "create_pem" {
    source = "./modules/create_pem"
    key_name = var.root_key_name
    key_path = var.root_key_path
}

module "create_sg" {
    source = "./modules/create_sg"
    sg_name = var.root_sg_name
}

module "create_ec2" {
    source = "./modules/create_ec2"
    instance_type = var.root_instance_type
    pem_key = module.create_pem.pem_key
    ec2_sg_id = module.create_sg.sg_id
}

module "file_provisione" {
    source = "./modules/file_provisioner"
    ec2_public_ip = module.create_ec2.ec2_public_ip_address
    ec2_user = var.root_ec2_user
    ec2_pem = var.root_key_path
    source_path = var.root_source_path
    destination_path = var.root_destination_path
}

module "remote_exec_inline_command" {
    source = "./modules/remote_exec"
    ec2_public_ip = module.create_ec2.ec2_public_ip_address
    ec2_user = var.root_ec2_user
    ec2_pem = var.root_key_path
    inline_commands = var.root_inline_commands
}

module "file_provisione_copy_script" {
    source = "./modules/file_provisioner"
    ec2_public_ip = module.create_ec2.ec2_public_ip_address
    ec2_user = var.root_ec2_user
    ec2_pem = var.root_key_path
    source_path = var.root_source_path_copy_script
    destination_path = var.root_destination_path_copy_script
}  

module "remote_exec_script" {
    source = "./modules/remote_exec"
    ec2_public_ip = module.create_ec2.ec2_public_ip_address
    ec2_user = var.root_ec2_user
    ec2_pem = var.root_key_path
    inline_commands = var.root_inline_script
}