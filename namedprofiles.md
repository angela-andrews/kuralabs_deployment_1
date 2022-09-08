# Creating Named Profiles for the AWS CLI

If you have multiple AWS accounts and you use the cli, creating named profiles is a great way to use the correct creds for the account you're trying to use. You can specify the profile when you run commands.

## Configure named profile
You should already have the aws cli configured. These steps are to add a named profile

- From the terminal, run `aws configure --profile <your cool profile name>`
- When prompted, enter your access key, secret key, chosen region and format type

![aws configure](/images/aws-configure.png)

To test your named profile, run:
`aws s3 ls --profile <your cool profile name>`


You should get a list of any S3 buckets you've created or an empty array if you haven't crated any **if** you have permission to view them. Your output is always going to be based off of your permissions.

## Use your named profile for multiple commands
At some point  you'll grow tired of entering --profile. You can create an environment variable to remedy that.

For Linux and Mac users:
` export AWS_PROFILE=<your cool profile name>`

![creating env variable](/images/env-var-profile.png)