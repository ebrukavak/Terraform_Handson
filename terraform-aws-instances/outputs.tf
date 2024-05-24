output "public_ip" {
  value =  aws_instance.ec2_terraform.public_ip 
}