#You need to do this bit first to find the computer image that you want to create on aws

# data "aws_ami" "computer_image" {
#   most_recent = true
#   owners      = ["amazon"]

#   filter {
#     name   = "name"
#     values = ["al2023-ami-2023.*-x86_64"]
#   }
# }

# resource "aws_instance" "demo_instance" {
#     # TO BE IMPLEMENTED
#   ami           = data.aws_ami.computer_image.id #instead of finding the ami above, you can hard code a string here instead
#   instance_type = "t2.micro"
#   tags = {
#     Name = "tf-example"
#   }
# }