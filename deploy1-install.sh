#!/bin/bash 

###############################################
# Name: Angela
# Date: 9/1/2022
# Info: This script is to install jenkins, it's dependencies and start the service
# Specs: Ubuntu 22.04 LTS
# Ports: 80, 8080, 22
# Version: 1.2
###############################################
echo "###############################################"
echo "Beginning server installation"
echo "###############################################"
sleep 3
# Update the software repos & update the server
sudo apt update  && sudo apt upgrade -y

# Install jre 
sudo apt install default-jre -y

# Add the Jenkins repo &  Get the gpg key for the Jenkins repo
if [ -z /usr/share/keyrings/jenkins.gpg ]
then
        rm -f /usr/share/keyrings/jenkins.gpg
	echo "Removing existing jenkins,gpg file"
else 
	echo "No existing GPG file. Continue..."
fi

#$wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io. key |sudo gpg --dearmor -o /usr/share/keyrings/jenkins.gpg
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key |sudo gpg --dearmor -o /usr/share/keyrings/jenkins.gpg

sudo sh -c 'echo deb [signed-by=/usr/share/keyrings/jenkins.gpg] http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

# Install Jenkins
echo "###############################################"
echo "Installing Jenkins"
echo "###############################################"
sleep 3

sudo apt update && sudo apt install jenkins -y

# start and enable jenkins service
sudo systemctl enable --now jenkins

echo "###############################################"
echo "Installing pip and venv"
echo "###############################################"
sleep 3
# Install pip and venv
sudo apt install python3-pip python3-venv -y

## get the DNS name from the meta-data and store to a variable called public-dns-name
sleep 3
printf "The following is the public DNS name.\n"
curl 169.254.169.254/latest/meta-data/public-hostname 

# Get the public IP address
printf "The following is the public IP address\n"
curl 169.254.169.254/latest/meta-data/public-ipv4
printf "The following is the initial Jenkins Admin Password: "
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
echo "###############################################"
echo "Install complete"
echo "###############################################"

