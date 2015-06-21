#!/bin/sh

# Import script globals
source ../project-config/globals.sh

##################################
# This script sets up SSH access #
#     to your Github account     #
##################################
echo ''
cecho "Setting up an SSH key for your GitHub account" $green
# Substitute your GitHub email account here
ssh-keygen -t rsa -b 4096 -C "zpalexander@gmail.com"

echo ''
cecho "Ensuring the SSH agent is running" $green
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
cecho "Adding SSH key to local SSH agent" $green
pbcopy < ~/.ssh/id_rsa.pub

echo ''
cecho "This script will now open GitHub" $green
cecho "Login if prompted and in the first screen, click 'Add SSH Key'" $green
cecho "Your recently created SSH key has already been copied to your clipboard" $green
cecho "Use CMD+V to paste it into the text box" $green
cecho "Then, click 'Add Key' and confirm the action by providing your GitHub password" $green
echo ''
cecho "Do you understand? (y/n)" $green
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  open https://github.com/settings/ssh
else
  cecho "You will need to complete this step to be able to push to and pull from GitHub" $green
  cecho "Navigate to https://help.github.com/articles/generating-ssh-keys/ for better instructions" $green
fi

read -n1 -r -p "When you have completed the steps above, press enter to verify setup..." key
pause 'Press [Enter] key to continue...'
ssh -T git@github.com


