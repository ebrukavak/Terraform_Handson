Terraform with Remote Provisioning for AWS EC2 Instance
This project demonstrates how to create an AWS EC2 instance using Terraform, configure remote provisioning via SSH, and perform tasks on the instance after creation.

Prerequisites
Terraform installed and configured: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli
An AWS account with IAM user and access keys set up: https://aws.amazon.com/resources/create-account/
SSH key pair (firstkey.pem) created and secured locally (permissions set to 400): https://linux.die.net/man/1/ssh-keygen
Note: Ensure the private key file path in the code matches your actual location.

Steps
Clone or Download Repository:
If you haven't already, clone or download this repository to your local machine.

Update Configuration (Optional):

Replace ami-0759f51a90924c166 with the desired AMI ID for your chosen operating system.
Update firstkey with your actual key name.
Initialize Terraform:
In your terminal, navigate to the project directory and run:

Bash
terraform init

Plan and Apply:

Review the planned changes by running:

Bash
terraform plan

If satisfied, apply the changes to create the infrastructure:

Bash
terraform apply

Retrieve Public IP (Optional):
The public IP address of the created EC2 instance will be stored in public_ip.txt. You can view it using:

Bash
cat public_ip.txt

Functionality
This Terraform configuration creates the following:

AWS Provider: Defines the AWS region (us-east-1 in this example).
Security Group (tf-provisioner-sg): Allows inbound SSH (port 22) and HTTP (port 80) traffic from anywhere (0.0.0.0/0) for provisioning purposes. Outbound traffic is unrestricted for the instance.
EC2 Instance (terraform-instance-with-provisioner):
Launches an EC2 instance with the specified AMI ID and instance type (t2.micro).
Uses the firstkey key pair for SSH access.
Assigns a security group for network access rules.
Tags the instance for identification.
Employs three provisioners:
Local-Exec: Writes the instance's public IP to a local file (public_ip.txt).
Remote-Exec: Connects to the instance via SSH and executes commands:
Installs the httpd web server using dnf.
Enables and starts the httpd service.
File: Creates a file (my_public_ip.txt) on the instance with its public IP address.
Security Considerations
Replace 0.0.0.0/0 in the security group ingress rules with more specific IP ranges if possible to restrict access.
Secure the firstkey.pem file with appropriate permissions (chmod 400).
Consider using AWS Secrets Manager for storing sensitive credentials like SSH key material.
Additional Resources
Terraform Documentation: https://developer.hashicorp.com/terraform/docs
AWS EC2 Documentation: https://docs.aws.amazon.com/ec2/
SSH Key Generation: https://linux.die.net/man/1/ssh-keygen
