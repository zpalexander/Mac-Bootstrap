#!/bin/sh

# Import script globals
source ../project-config/globals.sh

################################
# This script sets up Sublime  #
#   Text for web development   #
################################
cecho "Setting up Sublime Text..." $green

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
cecho "Opening Sublime Text. Make sure everything looks good." $green
/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl
pause 'Press [Enter] key to continue...'
