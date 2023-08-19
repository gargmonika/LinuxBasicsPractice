#Revision 1.0
# Aug 15, 2023
# !/bin/bash


# Copy and sychornize data from local to aws instance(ubuntu)

rsync -avz -e "ssh -i ~/ubuntu-demo.pem" ~/scripts/simple-php-website ubuntu@ec2-3-21-44-98.us-east-2.compute.amazonaws.com:~/Desktop/backup/
