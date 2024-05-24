Terraform Configuration for User-Specific S3 Buckets and IAM Users
This project demonstrates how to create individual S3 buckets and IAM users for each user defined in a variable using Terraform.

Functionality
S3 Buckets:
Creates an S3 bucket named example-tf-s3-bucket-<username> for each username provided in the var.users variable.
Utilizes toset to ensure usernames are unique and avoid potential naming conflicts.
IAM Users:
Creates an IAM user named after each username in the var.users variable.
Again, toset ensures uniqueness among user names.
Note: This example doesn't configure any specific IAM permissions for the users. You'll need to define appropriate policies separately based on your requirements.

Prerequisites
Terraform installed and configured: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli
An AWS account with IAM user and access keys set up: https://aws.amazon.com/resources/create-account/
Configuration
The Terraform code defines the following resources:

S3 Buckets (tf-s3):

Uses for_each to iterate over a set of usernames extracted from the var.users variable using toset.
Creates an S3 bucket for each username, dynamically constructing the bucket name with a prefix.
IAM Users (new_users):

Similar to S3 buckets, iterates over the toset(var.users) expression.
Creates an IAM user for each username provided in the variable.
Customization
Update the region in the implicit aws provider block if needed (usually defined in a separate file).

Define your usernames in the vars.tf file (create it if it doesn't exist):

Terraform
variable "users" {
  type = list(string)
  default = [
    "user1",
    "user2",
    "user3"
  ]
}

Modify the S3 bucket name prefix (example-tf-s3-bucket-) if desired.

Usage
Place the code in a file named main.tf.

Create a vars.tf file with your list of usernames.

Initialize Terraform:

Bash
terraform init

Review the planned changes:

Bash
terraform plan

Apply the changes:

Bash
terraform apply

Additional Notes
This example creates individual resources for each user. Consider using Terraform modules for better organization and reusability if managing a large number of users.
Remember to define appropriate IAM policies for the created users to grant them necessary permissions.