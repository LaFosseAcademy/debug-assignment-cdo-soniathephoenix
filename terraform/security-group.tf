resource "aws_security_group" "http_server_sg" {
  name   = "http_server_sg"
  vpc_id = "vpc-0f9fc70fc50df5a0d"
  tags = {
    name = "http_server_sg"
  }
}

resource "aws_security_group_rule" "http_ingress" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "http"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.http_server_sg.id
}

resource "aws_security_group_rule" "ssh_ingres" {
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "ssh"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_security_group.http_server_sg.id
}

resource "aws_security_group_rule" "app_port_ingress" {
  type              = "ingress"
  from_port         = 3000
  to_port           = 3000
  protocol          = "http"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.http_server_sg.id
}

resource "aws_security_group_rule" "egress" {
  type = "egress"
  from_port = 0
  to_port = 0
  protocol = -1
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.http_server_sg.id
}