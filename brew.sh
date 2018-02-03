#!/bin/sh

# Test to see if homebrew is installed, if not install it
if test ! $(which brew)
then
  echo "  Installing Homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" > /tmp/homebrew-install.log
fi

# Install cask, which installs non CLI apps
# https://caskroom.github.io/

brew tap caskroom/cask
brew install cask

# Install mas, an app store CLI interface
# https://github.com/mas-cli/mas
brew install mas

# Install some utility programs

brew install wget


# Install terminal emulator iterm2 
# https://www.iterm2.com/

brew cask install iterm2

# Install some browsers for testing
brew cask install firefox
brew cask install google-chrome

# This wrapper around tmux allows the use of pbcopy and pbpaste
brew install reattach-to-user-namespace

