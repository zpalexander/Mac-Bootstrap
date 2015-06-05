#!/bin/bash

# Variables
GREEN='\033[0;32m'
NC='\033[0m'


#######################################
#### Install Homebrew and Binaries ####
#######################################
# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
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
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}
