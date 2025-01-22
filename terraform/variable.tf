#Provider

variable "default_region"{
 description = "AWS region of the resources"
 type = string
 default = "us-east-1"
}

variable "aws_access_key" {
  description = "AWS access key"
  type        = string
  default     = ""
}

variable "aws_secret_key" {
  description = "AWS secret key"
  type        = string
  default     = ""
}
#VPC

variable "vpc_cidr" {
 description = "Casestudy batch-1 VPC cidr block"
 type = string
 default = "10.0.0.0/16"
}

variable "dns_support" {
 description = "Allowing dns support inside the VPC"
 type = bool
 default = true
}

variable "dns_hostnames" {
 description = "Allowing dns hostnames inside the VPC"
 type = bool
 default = true
}

variable "tags" {
 description = "default tags"
 type = map(string)
 default = {
   FASMException = "LKMTrainingRequirement"
   Application   = "apache-server"
   Owner         = "CaseStudyBatch01"
   Project       = "InfraDevOps-CaseStudy"
  }
}

#Subnet

variable "subnet_cidr" {
 description = "Casestudy batch-1 subnet cidr block"
 type = string
 default = "10.0.0.0/24"
 }

#Route Table

variable "rtb_cidr" {
 description = "Casestudy batch-1 routetable cidr block"
 type = string
 default = "0.0.0.0/0"
}

#Security Group

/*

variable "sg_name" {
 description = "Casestudy batch-1 security group"
 type = string
 default = "Batch_1_sg"
}

variable "sg_des" {
 description = "Description of security grp"
 type        = string
 default     = "allowing https,http,ssh on restricted port and all traffic in outbound"
 }
*/

#Inbound rules
/*
variable "all_traffic_cidr" {
  description = "allowing all traffic from anywhere"
  type        =  string
  default     = "0.0.0.0/0"
}

variable "https_port" {
  description = "port number of https"
  type        = number
  default     = 443
}

variable "http_port" {
  description = "port number of http"
  type        = number
  default     = 80
}

variable "ssh_port" {
  description = "port number of ssh"
  type        = number
  default     = 22
}

variable "protocol" {
  description = "Ip protocol of rules"
  type        = string
  default     = "tcp"
}


variable "my_ip" {
  description = "ssh allowed ip address"
  type        = string
  default     = "34.253.173.41/32"
} 

*/


#Outbound rules

variable "port_zero" {
 description = "allowing all traffic"
 type        = number
 default     = 0
}

variable "all_traffic_protocol" {
 description = "allowing all traffic protocol"
 type        = string
 default     = "-1"
}


#EC2Instance

variable "ami_id" {
 description = "Image id of the EC2Instance"
 type        = string
 default     = "ami-0df8c184d5f6ae949"
}

variable "instance_type" {
 description = "Instance type of the instance"
 type        = string
 default     = "t2.micro"
}

variable "instance_monitor_status" {
 description = "enabling monitoring for EC2Instance"
 type        = bool
 default     = true
}

/* 

variable "profile_name" {
  description = "EC2Instance CaseStudy profile"
  type        = string
  default     = "EC2FullAccessCaseStudy_Profile"
}

*/

variable "jenkins_key" {
  description = "Key-Value pair stored in Jenkins"
  type 	      = string
  default       = "newcasestudy"
  #Value is passed dynamically in Jenkins
}






