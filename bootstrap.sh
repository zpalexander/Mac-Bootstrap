#!/bin/sh

# Variables

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
