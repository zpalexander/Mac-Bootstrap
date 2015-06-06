#!/bin/sh

# Variables
GREEN='\033[0;32m'
red='\033[0;31m'
NC='\033[0m'
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

# Color-echo. Improved. [Thanks @joaocunha]
# arg $1 = message
# arg $2 = Color
cecho() {
  echo "${2}${1}${reset}"
  return
}

# Set continue to false by default
CONTINUE=false

echo ""
cecho "###############################################" $red
cecho "#        DO NOT RUN THIS SCRIPT BLINDLY       #" $red
cecho "#         YOU'LL PROBABLY REGRET IT...        #" $red
cecho "#                                             #" $red
cecho "#              READ IT THOROUGHLY             #" $red
cecho "#         AND EDIT TO SUIT YOUR NEEDS         #" $red
cecho "#                                             #" $red
cecho "#        THIS WILL SET UP YOUR PROGRAMS       #" $red
cecho "###############################################" $red
echo ""

echo ""
cecho "Have you read through the script you're about to run and " $red
cecho "understood that it will make changes to your computer? (y/n)" $red
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  CONTINUE=true
fi

if ! $CONTINUE; then
  # Check if we're continuing and output a message if not
  cecho "Please go read the script, it only takes a few minutes" $red
  exit
fi


###############################
#### Install Mac Dev Tools ####
###############################
echo -e "${GREEN}Installing XCODE...${NC}"
sudo xcode-select --install

#######################################
#### Install Homebrew and Binaries ####
#######################################
# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo -e "${GREEN}Installing homebrew...${NC}"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

# Sometimes brew has permissions problems, this is a useful fix
sudo chown -R `whoami` /usr/local

# Install GNU core utilities (those that come with OS X are outdated)
brew install coreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

# Install Bash 4
brew install bash

# Install more recent versions of some OS X tools
brew tap homebrew/dupes
brew install homebrew/dupes/grep

$PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH

# Install CLI binaries
binaries=(
  graphicsmagick
  webkit2png
  rename
  zopfli
  ffmpeg
  python
  sshfs
  trash
  node
  tree
  ack
  hub
  git
  bash-completion
  vim
  wget
  docker
)

echo -e "${GREEN}Installing binaries...${NC}"
brew install ${binaries[@]}

# Clean up after all these installs
brew cleanup


######################
#### Install Apps ####
######################
brew install caskroom/cask/brew-cask
# Apps
apps=(
  adium
  android-studio
  boot2docker
  dropbox
  filezilla
  google-chrome
  google-drive
  google-hangouts
  handbrake
  libreoffice
  slack
  appcleaner
  firefox
  qlmarkdown
  vagrant
  flash
  iterm2
  sequel-pro
  sublime-text2
  virtualbox
  flux
  mailbox
  nocturne
  qlstephen
  vlc
  quicklook-json
  skype
  transmission
  netbeans
  nmap
  virtualbox
  liteicon
  vagrant
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo -e "${GREEN}Installing apps...${NC}"
brew cask install --appdir="/Applications" ${apps[@]}


#########################################
#### Install Non-PM Managed Binaries ####
#########################################
echo -e "${GREEN}Installing stuff for web dev...${NC}"
\curl -sSL https://get.rvm.io | bash -s stable --ruby
source /Users/zpalexander/.rvm/scripts/rvm
