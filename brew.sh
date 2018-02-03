#!/bin/sh

# The aim of this script is to be able to run it once to set up a mac
# and again at any time to update

# Many thanks to:
# Deian Isac https://medium.com/@deianisac/how-to-quickly-set-up-a-mac-b9f89aed0dc 

# Test to see if homebrew is installed, if not install it
if test ! $(which brew)
then
  echo "  Installing Homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" > /tmp/homebrew-install.log
fi

# Update recipies
brew update

# Update installed formulae
brew upgrade --all

# Install cask, which installs non CLI apps

brew tap caskroom/cask
brew install cask

# Install mas, an app store CLI interface
brew install mas

# Install wget, for downloading files over http/s or ftp 
brew install wget

# Install vlc media player
brew install cask vlc

# Install terminal emulator iterm2 
brew cask install iterm2

# Install password manager
brew cask install 1password

# Install caffeine, an app that stops your mac sleeping while active
brew cask install caffeine

# Install cakebrew, a handy GUI for homebrew
brew cask install cakebrew

# Install dropbox, for managing files across devices
brew cask install dropbox

# Install flux, an app that warms screen colours at night to aid sleep
brew cask install flux

# Install imageoptim, an image file size reducer (reduces metadata etc)
brew cask install imageoptim

# Install kapako, an ambient sound mixer / player
brew cask install kapako

# Install little snitch, to keep an eye on your network
brew cask install little-snitch

# Install some browsers for testing
brew cask install firefox
brew cask install google-chrome

# This wrapper around tmux allows the use of pbcopy and pbpaste
brew install reattach-to-user-namespace

# Cleanup brew and cask
brew cleanup
brew cask cleanup
