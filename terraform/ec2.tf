variable "aws_access_key" {}
variable "aws_secret_key" {}

resource "aws_security_group" "acn_sg" {
  name   = "mysecuritygroup"
  vpc_id = "vpc-07e6aabf13649c7b5"

  # SSH access from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP access from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound internet access
   egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    "FASMException" = "LKMTrainingRequirement"
  }
}


#EC2-Instance

resource "aws_instance" "ec2_instance"{
 ami = "ami-0df8c184d5f6ae949"
 instance_type = "t2.micro"
 vpc_security_group_ids = [aws_security_group.acn_sg.id]
 key_name               = "demoserver"
 tags   = {
   "OS" = "amazon"
 }
 root_block_device {
    encrypted   = true
  }
}



output "public_ip" {
  description = "The private IP address of the EC2 instance"
  value       = aws_instance.ec2_instance.public_ip
}
