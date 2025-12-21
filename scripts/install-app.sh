#!/bin/bash
apt update -y
apt install httpd -y
systemctl start httpd
systemctl enable httpd
echo "AWS Migration Project Running" > /var/www/html/index.html
