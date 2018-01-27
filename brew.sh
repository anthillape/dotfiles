#!/bin/sh

echo "Installing brew"

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"



# This wrapper around tmux allows the use of pbcopy and pbpaste
brew install reattach-to-user-namespace

