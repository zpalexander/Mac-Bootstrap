#!/bin/sh

# Variables
GREEN='\033[0;32m'
NC='\033[0m'
function pause() {
  read -p "$*"
}

echo -e "${GREEN}Setting up Sublime Text...${NC}"

# Download and install Package Control
wget https://packagecontrol.io/Package%20Control.sublime-package
if [ ! -d "~/Library/Application\ Support/Sublime\ Text\ 2/Installed\ Packages/" ]; then
  mkdir ~/Library/Application\ Support/Sublime\ Text\ 2/Installed\ Packages/
fi
mv Package\ Control.sublime-package ~/Library/Application\ Support/Sublime\ Text\ 2/Installed\ Packages/

# Copy Configuration Files
cp ../config-files/Package\ Control.sublime-settings ~/Library/Application Support/Sublime Text 2/Packages/User/Package\ Control.sublime-settings
cp ../config-files/packagecontroleferences.sublime-settings ~/Library/Application Support/Sublime Text 2/Packages/User/Preferences.sublime-settings

# Open Sublime Text to make sure everything looks good
echo ''
echo -e "${GREEN}Opening Sublime Text. Make sure everything looks good.${NC}"
/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl
pause 'Press [Enter] key to continue...'
