# Pre-requisites
**Populate all the required values in creds.tfvars file**
**Terraform v.0.11.8 is being used**

## Deployment steps
Terraform is being used to bring up and bootstrap the instances in AWS along with front-end ELB
The instances can be deployed in Public/Private subnet. If you give values of Public subnet in creds.tfvars file at both the places, instances will be placed in Public subnet along with public IP.
If instances needs to be placed in private subnet, give appropriate values in creds.tfvars file and comment out associate_public_ip_address line in main.tf file

1. Execute **terraform init** command to initialize the providers
2. Execute **terraform plan -var-file creds.tfvars** to get the overview of what resources will be provisioned
3. Execute **terraform apply -var-file creds.tfvars** to actually provision the resources
4. Test the application and execute **terraform destroy -var-file creds.tfvars** to terminate/decommission the resources

## Ansible for Upgrades
**code change commit made to git with -a and -m tags with Release**
***git tag -a "1.0.0" -m "Release 1.0.0"***
Populate an inventory file with the Public IPs of the provisioned instances
Specify the version of application that needs to be deployed under hosts file.
1. Add your key file under ansible directory and set proper permissions (chmod 400)
2. Update the git URL and version in *hosts* file under *[webservers:vars]* title
3. Execute **ansible-playbook -i hosts tasks/main.yml** to upgrade the application version
