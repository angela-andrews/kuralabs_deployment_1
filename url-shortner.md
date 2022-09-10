# Installing the URL Shortner App on EC2

## Create EC2 instances
Create 2 new Ubuntu 22.04 LTS instance as a t2micro. Create a security group that has port 22, 80, 8080 open for your instance. One will be for your Flask application, one will be for your testing client. Name them accordingly. Log in once your instances are running.

## Installing the Flask App

On your Flask server, copy over the zip file that contains the flask app (It isn't on github, the instructor provides a google drive link). Rename the zip file to files.zip. Run the script from the same directory your zip file is located. The script assumes you're using the Ubuntu user that comes as the default user.

` scp -i "yourpem.pem" files.zip ubuntu@<yourIP>:`

` scp -i "yourpem.pem" [url-shortener-install.sh](https://github.com/angela-andrews/kuralabs_deployment_1/blob/main/url-shortener-install.sh) ubuntu@<yourIP>: `

Make the script executable

`chmod u+x url-shortener-install.sh `

Run this command to update your .bashrc. Exit your shell and log back in before you start the script.

` echo "PATH=$PATH:/home/ubuntu/.local/bin">> ~/.bashrc `

Confirm your path has been set

` echo $PATH `

Run the script using the source command. Source works in the current shell, meaning, like bash, it won't start a subshell and exit it when running the script. There is a ` cd ` command that has to occur and in order for that to occur, use `source ` to run it.

` source url-shortener-install.sh `

or 

` . url-shortener-install.sh `

When the script is complete, launch the the flask app in the browser.


