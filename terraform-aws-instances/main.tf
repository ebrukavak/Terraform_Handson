resource "aws_instance" "ec2_terraform" {
  ami = data.aws_ami.amazon-linux-2.id
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = [aws_security_group.tf-sec-gr.id]
  user_data = file("${abspath(path.module)}/userdata.sh")
}

resource "aws_security_group" "tf-sec-gr" {
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port =0
    to_port =0
    protocol="-1"
    cidr_blocks = ["0.0.0.0/0"] 
  }    
}

