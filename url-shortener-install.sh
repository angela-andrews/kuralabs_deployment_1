#!/bin/bash

########################################################################
# Installing pip and flask app dependencies on a new Ubuntu 22.04 instance
# Steps to prepare the system for the script:
# 1) Make sure your version of python matches the version on the sed line below
# 2) Also, be sure your zip file is called files.zip and is in the root
# of  your home directory. the script will unzip from the pwd and cd you
# into the url-shortner directory
# 3)Set the path before running the script, exit the shell and come back in 
# before you run the script
#
# Run this command using source ./url-shortener-install.sh
#
# Date: 9/8/2022
# version: 1.2
#######################################################################


echo "+++++++++++++++++++++++++++++++++++++++++++++++++"
echo "Updating server and installing packages"
echo "+++++++++++++++++++++++++++++++++++++++++++++++++"
sleep 3
sudo apt update -y
sudo apt install tree unzip python3-pip -y


echo "+++++++++++++++++++++++++++++++++++++++++++++++++"
echo "Unzipping files.zip"
echo "+++++++++++++++++++++++++++++++++++++++++++++++++"
sleep 2
unzip files.zip
cd url-shortener/


echo "+++++++++++++++++++++++++++++++++++++++++++++++++"
echo "Insalling pipenv"
echo "+++++++++++++++++++++++++++++++++++++++++++++++++"
pip3 install pipenv

echo "+++++++++++++++++++++++++++++++++++++++++++++++++"
echo "Output of your pip list"
echo "+++++++++++++++++++++++++++++++++++++++++++++++++"
pip install flask
pip list | grep Flask
sleep 5

#mypyversion=$(which python3)
#pipenv --python $(mypyversion)

echo "+++++++++++++++++++++++++++++++++++++++++++++++++"
echo "Updating the python version in the Pipfile to 3.10.4"
echo "+++++++++++++++++++++++++++++++++++++++++++++++++"
sed -i 's/3.8/3.10.4/' Pipfile

export FLASK_APP=app
flask run --host=0.0.0.0 -p 8080
