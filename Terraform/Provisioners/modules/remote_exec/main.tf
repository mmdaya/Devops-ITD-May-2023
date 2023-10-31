resource "null_resource" "remote_exec" {
    connection {
        type = "ssh"
        host = var.ec2_public_ip
        user = var.ec2_user
        private_key = file(var.ec2_pem)
        agent = false
    }

    provisioner "remote-exec" {
        inline = var.inline_commands
    }
}
   
   