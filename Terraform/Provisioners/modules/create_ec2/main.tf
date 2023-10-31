data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "my_instance" {
    ami = data.aws_ami.ubuntu.id
    instance_type = var.instance_type
    key_name = var.pem_key
    vpc_security_group_ids = [var.ec2_sg_id]
    tags = {
        Name = "First_Terraform_resource_creation"
    } 
}