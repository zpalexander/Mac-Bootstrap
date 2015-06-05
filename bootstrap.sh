#!/bin/bash

# Variables
GREEN='\033[0;32m'
NC='\033[0m'

# Install programs for the Mac
bash scripts/install-programs.sh

# Set settings for the Mac
bash scripts/set-settings.sh

# Move configuration files into place
cp config-files/.bash_profile ~/.bash_profile
cp config-files/.gitconfig ~/.gitconfig
