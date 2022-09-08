# Configuring Jenkins for Pipelines

## Setting up GitHub

- Create a test repo with a README
- Create a Jenkins file in the test repo & insert this text
```
pipeline { 
agent any 
stages { 
stage ('Build') {
 steps { 
sh 'echo "HELLO WORLD"' 
sh ''' 
echo "This will list current dir content from latest"
 ls -lh
 '''
 } 
} 
stage ('Test') { 
steps { 
sh 'echo "HELLO TEST"' 
sh ''' 
echo "This list current dir" 
pwd 
''' }
 }
 }
 }
```
- Create another branch in the test repo & edit the Jenkinsfile to make it slightly different than the one in the main branch
```
pipeline { 
agent any 
stages { 
stage ('Build') {
 steps { 
sh 'echo "HELLO Angela"' 
sh ''' 
echo "Welcome to Branch 2"
uname -a
 '''
 } 
} 
stage ('Test') { 
steps { 
sh 'echo "HELLO Branch2"' 
sh ''' 
echo "Ran a uname command" 
uname -a 
'''
 }
 }
 }
 }
```
- Create a new personal access token for use with Jenkins (or use a current token you have saved)
    - In GitHub, profile > developer settings > personal access token > generate new token > name it & set the expiration date.
    - Under select scopes, check **repo, admin:org and notifications** checkboxes. Click Generate Token
    - Save this token somewhere as you'll use it in Jenkins

## Setting up Jenkins

From the Jenkins Dashboard, click on New item.
- Enter a name for the new item
- Scroll down and select Multibranch pipeline. Click OK
- Give your multibranch pipeline a name and description
- Under branch sources, click add source
    - select Github
    - click Add then click the item you just created
    - In the username field, enter your github username. In the password field, paste in your personal access token. Give your credential a name to identify it. Click add.
    - In the credentials dropdown, select your credentials.
    - Copy the HTTPS url from your repo & paste it under repository HTTPS url
    - Click save
- Review the activity and the scan repository logs
- Review the pipeline, hopefully both branches are sunny. If not, troubleshoot to figure out why. Once you've figured it out, scan the repository.
- Next, make a change to the commands in the Jenkinsfile in Github. In Jenkins, click Scan Repository Now. Watch the progress. Watch for a succssful build.
- Next, we'll add a filter
    - From your build dashboard, click on configure > Branch Sources. Scroll down to **Discover pull request from forks**. Click add.
    - Select add filter by name (with wildcards)
        - Enter the branch name (main)
        - Exclude b* (in my case, I'm excluding any branch that begins with b)
        - Click Save.
    - Review the Scan Repository Logs
    - Review the project dashboard  and you'll see your branch2 was removed & the scan of the repo succeeded.

## Setting up GitHub WebHooks

From GitHub, go to the repo settings, webhooks > add webhook
- The payload URL is http://<Jenkins IP>:8080/github-webhook/
- The content type is json
- Select the "send my everything" radio button
- Click Add Webhook
- In a few moments, you should have a green checkmark next to your URL

Make a change in your code to see the webhook in action. Go back to Jenkins to confirm the build ran automatially via the webhook.
