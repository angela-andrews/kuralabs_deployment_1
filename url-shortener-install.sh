#!/bin/bash

########################################################################
# Installing pip and flask app dependencies
# make sure your version of python matches the version on the sed line below
# Also, be sure you zip file is called files.zip and is in the root
# of  your home directory. the script will unzip fron the pwd and cd you
# into the url-shortner directory
#
# Run this command using source ./url-shortener-install.sh
#
# Date: 9/8/2022
# version: 1.0
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
