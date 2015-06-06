#!/bin/bash

# Variables
GREEN='\033[0;32m'
# Resets the style
reset=`tput sgr0`

# Color-echo. Improved. [Thanks @joaocunha]
# arg $1 = message
# arg $2 = Color
cecho() {
  echo "${2}${1}${reset}"
  return
}

##################################
# This script sets up SSH access #
#     to your Github account     #
##################################
echo ''
cecho "Setting up an SSH key for your GitHub account" $GREEN
# Substitute your GitHub email account here
ssh-keygen -t rsa -b 4096 -C "zpalexander@gmail.com"

echo ''
cecho "Ensuring the SSH agent is running" $GREEN
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
cecho "Adding SSH key to local SSH agent" $GREEN
pbcopy < ~/.ssh/id_rsa.pub

echo ''
cecho "This script will now open GitHub" $GREEN
cecho "Login if prompted and in the first screen, click 'Add SSH Key'" $GREEN
cecho "Your recently created SSH key has already been copied to your clipboard" $GREEN
cecho "Use CMD+V to paste it into the text box" $GREEN
cecho "Then, click 'Add Key' and confirm the action by providing your GitHub password" $GREEN
echo ''
cecho "Do you understand? (y/n)" $GREEN
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  open https://github.com/settings/ssh
else
  cecho "You will need to complete this step to be able to push to and pull from GitHub" $GREEN
  cecho "Navigate to https://help.github.com/articles/generating-ssh-keys/ for better instructions" $GREEN
fi

read -n1 -r -p "When you have completed the steps above, press space to verify setup..." key

if [ "$key" = ' ' ]; then
  ssh -T git@github.com
fi


