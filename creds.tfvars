aws_access_key      = ""
aws_secret_key      = ""
region              = "us-east-1"
vpc_id              = "vpc-"
##### Value of public_subnets and subnet_ids can be kept same which will be the subnet IDs of Public Subnet
public_subnets      = ["subnet-", "subnet-"] #subnet ID of the public subnets in us-east-1a and us-east-1b
subnet_ids          = ["subnet-", "subnet-"] #subnet ID of the private subnet in AZ us-east-1 and us-east-1b

availability_zones  = ["us-east-1a", "us-east-1b"]
key_name            = "" #Key name already present in AWS
instance_types	    = ["t3.micro", "t3.small", "t3.medium", "t3.large"]
grade               = "test"
env_appender        = "test"
sg_env_prefix       = "test"
ssl-cert-arn        = "" #ARN of SSL certificate hosted on ACM (if any) Comment out listener 443 in load-balancer in main.tf if there's no certificate
instance_count      = 3
