#!/bin/bash
sudo su
ping -W 120 -c 1 google.com
yum -y update
yum -y install httpd git
cd /tmp
git clone https://github.com/watchmen-test/webdeploy.git
mv /tmp/webdeploy/test-app/* /var/www/html
service httpd start
