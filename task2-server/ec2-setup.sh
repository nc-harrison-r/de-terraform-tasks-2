#!/bin/bash
# create text files
echo "creating a txt file"
mkdir /home/ec2-user/help_dir
echo "directory created"
echo "hello world" > /home/ec2-user/help_dir/this_is_mine.txt
echo "somebody" > /home/ec2-user/shrek-the-thrd
echo "file created"

# create html page
sudo yum update -y
sudo yum install httpd -y
mkdir /var/www/html/
echo '<html><h1>Hello This is my first web page</h1></html>' > /var/www/html/index.html
sudo systemctl start httpd.service