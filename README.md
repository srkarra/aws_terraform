This is a simple Terraform project to understand the basics and it's functioning to automate AWS infrastructure.
This repo consists of a main.tf file where the configurations for building the AWS infrastructure are defined.
The terraform.tfvars contains the AWS keys
The variables.tf file contains the varibles which could be used in the main configuration file. This would be helpful when you spinning up multiple instances in various regions

We first run the `terraform init` command to initiate terraform in the current directory. It loads all the configurations in the current directory
`terraform plan` command is highly useful when you make changes to existing configuration. It basically gives an overview of your plan by showing the differences between the current state and to the state you would like to update your configuration to. It also highlights any errors that you might make while writing your configurations.

Once the output of terraform plan looks good, running `terraform apply` comamnd applies the configuration changes onto your provider. In this project, all the infrastructure is managed using AWS.

When you run apply command, it creates a `.tfstate` file and `.tfstate.backup` files in consecutive runs which stores the configuration of your entire infrastructure and you are supposed to store this securely like in an S3 bucket which can be retrived and used by your teams when needed. It is recommended to never commit these files in the repo, but rather add them 
to  `.gitignore` file.