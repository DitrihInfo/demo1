
#  AWS Sec-group  for Demo1

provider "aws" {
    
    region                  = "eu-central-1"
    
 }
resource "aws_security_group" "demo1-sec-group" {
    name        = "demo1-sec-group"
    description = "Security group for MyFirstDemo"    
    
   dynamic "ingress"  {
	for_each = ["22", "80", "8080"]
	content {
	        
        from_port        = ingress.value
        to_port          = ingress.value
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
      } 
    }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    tags = {
      Name = "MyFirstDemo-allow-22-80-8080ports"
    }
}
#  AWS instants for Demo1   

resource "aws_instance" "webserverDemo1" {
    ami                     = "ami-00d5e377dd7fad751" ## Ubuntu Server 18.04 LTS (HVM), SSD Volume Type - ami-00d5e377dd7fad751
    instance_type           =  "t2.micro" # Instance Type
    key_name = "newfrankfurt"
    vpc_security_group_ids  = [aws_security_group.demo1-sec-group.id]
    user_data               = file("upwebsite.sh")

    tags = {
        Name = "WebserverDemo1"
        Owner = "Demo1"
        Project = "MyFirstDemo"
        Description = "Apache2"
    }
}
resource "aws_instance" "jenkinsDemo1" {
    ami                     = "ami-00d5e377dd7fad751" # Ubuntu Server 18.04 LTS (HVM), SSD Volume Type - ami-00d5e377dd7fad751
    instance_type           = "t2.micro" # Instance Type
    key_name = "newfrankfurt"
    vpc_security_group_ids  = [aws_security_group.demo1-sec-group.id]
    user_data               = file("upjenkins.sh")

    tags = {
        Name = "JenkinsDemo1"
        Owner = "Demo1"
        Project = "MyFirstDemo"
        Description = "Jenkins"
    }
}
