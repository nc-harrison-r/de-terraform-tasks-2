data "aws_ami" "computer_image" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

resource "aws_instance" "demo_instance" {
  ami           = data.aws_ami.computer_image.id
  instance_type = "t2.micro"
  #vvvvv added the following lines vvvvvv
  key_name = "key_pair"
  security_groups = [aws_security_group.allow_ssh.name]
  user_data = "${file("ec2-setup.sh")}"
  user_data_replace_on_change = true
  #^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  tags = {
    Name = "tf-example"
  }
}