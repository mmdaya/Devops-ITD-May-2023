output "ec2_public_ip_address" {
    value = aws_instance.my_instance.public_ip
}

output "ec2_public_dns" {
    value = aws_instance.my_instance.public_dns
}

output "ec2_private_ip_address" {
    value = aws_instance.my_instance.private_ip
}

output "ec2_security_groups_id" {
    value = aws_instance.my_instance.vpc_security_group_ids
}
