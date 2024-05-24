AWS EC2 Instance with Terraform
This guide demonstrates how to create a simple EC2 instance on Amazon Web Services (AWS) using Terraform.

Prerequisites
Terraform is installed and configured.
An AWS account with IAM user and access keys set up.
Steps
Create Terraform Configuration File:

Save the following Terraform configuration code to a file named main.tf. This file defines your AWS region, EC2 instance AMI ID, instance type, key name, user data, and tags.

Terraform
provider "aws" {
  region = "us-east-1" # Replace with your desired AWS region
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0" # Replace with a suitable AMI ID
  instance_type = "t2.micro" # EC2 instance size (t2.micro is an example, change as needed)
  key_name      = "my-key-name" # Replace with your key name
  user_data     = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install -y yum-utils
    sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
    sudo yum -y install terraform
  EOF
  tags = {
    Name = "Terraform-EC2-Example" # Assign a tag to the EC2 instance
  }
  provisioner "local-exec" {
    command = "echo http://${self.public_ip} > public_ip.txt"
  }
}
Kodu dikkatli kullanın.
Initialize Terraform:

Navigate to your Terraform directory and run the following commands:

Bash
terraform init
terraform plan
terraform apply
Kodu dikkatli kullanın.
This will initialize Terraform, generate an execution plan, and create the EC2 instance.

Retrieve Public IP:

To get the public IP address of the created EC2 instance, run:

Bash
cat public_ip.txt
Kodu dikkatli kullanın.
Notes
This example uses the us-east-1 region and ami-0c55b159cbfafe1f0 AMI ID. Update these values with your own region and AMI ID.
Replace my-key-name with your actual key name.
The user data installs Terraform on the EC2 instance. Modify it as needed.
The EC2 instance is tagged with "Terraform-EC2-Example". Add or modify tags as needed.
Additional Resources
Terraform Documentation: https://www.terraform.io/docs/
AWS EC2 Documentation: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts.html
