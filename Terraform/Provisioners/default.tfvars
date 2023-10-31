root_key_name = "my_pem"
root_key_path = "./key/my_pem.pem"
root_instance_type = "t2.micro"
root_ec2_user = "ubuntu"
root_source_path = "./conf"
root_destination_path = "/home/ubuntu/direct"
root_source_path_copy_script = "./conf/install.sh"
root_destination_path_copy_script = "/home/ubuntu/install.sh"
root_inline_commands = ["sudo apt update -y", 
                        "sudo apt install -y nginx git jq",
                        "echo 'This is remote-exec inline command example' > remote-exec.txt"]
root_inline_script = ["sudo chmod 500 /home/ubuntu/install.sh", "sudo bash /home/ubuntu/install.sh"]
root_sg_name = "allow_ssh_http_https"