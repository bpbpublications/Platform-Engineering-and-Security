terraform {

required_providers {
aws={
source = “hashicorp/aws”
version=”~>4.16”
}
}
required_version=”>1.2.0”
}

provider “aws” {
region=”ap-south-1”
}

Resource “aws_instance” “app_server” {
	ami = “ami-232024e2”
	instance_type = “t2.medium”
	Tags=  {
		Name=”ExampleInstance”
	}
}

