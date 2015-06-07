#!/bin/sh

# Set the colours you can use
black='\033[0;30m'
white='\033[0;37m'
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
magenta='\033[0;35m'
cyan='\033[0;36m'
# Resets the style
reset=`tput sgr0`

# Color-echo
# arg $1 = message
# arg $2 = Color
cecho() {
  echo "${2}${1}${reset}"
  return
}

# Start by updating the OS
sudo softwareupdate --list
sudo softwareupdate --install --all

# Install programs for the Mac
bash scripts/install-programs.sh

# Set settings for the Mac
bash scripts/mac-settings.sh

# Move configuration files into place
cp config-files/.bash_profile ~/.bash_profile
cp config-files/.gitconfig ~/.gitconfig

# Set up GitHub SSH access
bash scripts/github-ssh.sh

# Set up Sublime
bash scripts/configure-sublime.sh

echo ""
cecho "############################" $green
cecho "#        YOU'RE DONE       #" $green
cecho "#            YAY           #" $green
cecho "############################" $green
echo ""
