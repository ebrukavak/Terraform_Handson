# Terraform AWS sağlayıcısı tanımlama
provider "aws" {
  region = "us-east-1"  # İstediğiniz AWS bölgesini burada belirtin
}

# EC2 örneği oluşturma
resource "aws_instance" "example" {
  ami           = "ami-0d7a109bf30624c99"  # EC2'nin kullanacağı Amazon Linux AMI (Bunu uygun bir AMI ID ile değiştirin)
  instance_type = "t2.micro"               # EC2 örneğinin boyutu (T2 Micro örneği örneğidir, isteğe bağlı olarak değiştirilebilir)
  key_name = "firstkey"                        # kendi key'in ile değiştir.

  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install -y yum-utils
    sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
    sudo yum -y install terraform
  EOF

  tags = {
    Name = "Terraform-EC2-Example"  # EC2 örneğine bir etiket verme
  }
  provisioner "local-exec" {
      command = "echo http://${self.public_ip} > public_ip.txt"
  
  }  
}