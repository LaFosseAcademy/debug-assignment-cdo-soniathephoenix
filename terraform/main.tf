terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
    region = "us-east-1"
}



resource "aws_instance" "http_server" {
  ami = "ami-053a45fff0a704a47"
  key_name = "default-ec2"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.http_server_sg.id]
  # subnet_id = data.aws_subnets.default_subnets.ids[0]
  subnet_id = "subnet-0feb65365c289de97"
  connection {
    type = "ssh"
    host = self.public_ip
    user = "ec2-user"
    private_key = file(var.aws_key_pair)
  }
  provisioner "remote-exec" {
      inline = [ 
        "sudo yum install httpd -y",
        "sudo service httpd start",
        "echo Welcome - Virtual server is at ${self.public_dns} | sudo tee /var/www/html/index.html"
      ]
    }
}

variable "aws_key_pair" {
    default = "~/aws/aws_keys/default-ec2.pem"  
}