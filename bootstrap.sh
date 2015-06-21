#!/bin/sh

# Import script globals
source project-config/globals.sh

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
