resource "aws_security_group" "allow_ssh" {
     name        = "terraform-group"
  description = "Allow SSH and HTTP traffic to terraform EC2"

  tags = {
    Name        = "terraform-tasks"
    Environment = "sprint-solutions"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ingress" {
  security_group_id = aws_security_group.allow_ssh.id
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_ingress" {
  security_group_id = aws_security_group.allow_ssh.id
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_egress_rule" "allow_ssh_egress" {
  security_group_id = aws_security_group.allow_ssh.id
  from_port         = 0
  to_port           = 0
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"
}

#can do ingress and egress in one resource if you like. See databrain solutions. 
#egress is outbound traffic.
#ingress is inbound traffic.

#to check everything is working, go to the ec2 instance, click connect and connect again. 
#then go to http:<the ip address of the ec2 instance> and you sould be able to see the html that your bash script created.