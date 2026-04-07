#!/bin/bash

# This script is used to install nginx web server on EC2 instance

sudo apt update -y
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx

echo "<h2>nginx installation is completed</h2>" > | sudo tee /var/www/html/index.html # tee used to write the output of echo command to index.html file and display the output on terminal as well  