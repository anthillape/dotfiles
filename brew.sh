#!/bin/sh

echo "Installing brew"

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install cask, which installs non CLI apps
# https://caskroom.github.io/

brew tap caskroom/cask
brew install cask

# Install terminal emulator iterm2 
# https://www.iterm2.com/

brew cask install iterm2

# This wrapper around tmux allows the use of pbcopy and pbpaste
brew install reattach-to-user-namespace

