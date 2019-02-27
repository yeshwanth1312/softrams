/* Variables */
provider "aws" {
  region     = "${var.region}"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
}

variable "aws_access_key" {
  description = "Enter AWS access key"
}

variable "aws_secret_key" {
  description = "Enter AWS secret key"
}

variable "region" {
  description = "Select the default AWS region for the deployment."
}

variable "ami_linux" {
  type = "map"

  default = {
    ap-south-1 = "ami-0ad42f4f66f6c1cc9"
    us-west-2 = "ami-a07379d9"
  }

  description = "Select appropriate AMI for required Linux Distro. Default is Amazon Linux."
}

variable "instance_types" {
  description = "Instance type to be used for instances"
  type        = "list"
}

variable "vpc_id" {
  description = "VPC ID"
}

variable "subnet_ids" {
  description = "List of private subnet ids."
  type        = "list"
}

variable "public_subnets" {
  description = "List of public subnet ids"
  type        = "list"
}

variable "availability_zones" {
  description = "List of availability zones."
  type        = "list"
}

variable "key_name" {
  description = "Key pair to be used for launching instances."
}

variable "sg_env_prefix" {
  description = "Enter environment name as prefix for creating security groups. For eg. stg, prod, qa, etc."
}

variable "grade" {
  description = "Type of environment whether it is dev/qa/stg/prod. Enter complete name as development or staging or production"
}

variable "env_appender" {
  description = "Environment name to be appended with Instance Name. For eg. stg, prod, qa, etc."
}

variable "ssl-cert-arn" {
  description = "ARN for the OperativeOne SSL Certificate from AWS Certificate Manager"
}

variable "instance_count" {
  description = "No. of instances to be provisioned"
}
