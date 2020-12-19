#!/bin/bash

set -euo pipefail

source ./util.sh

getRootDir

# You will need to make sure there is a Frameworks directory

if [ ! -d "/usr/local/Frameworks" ]; then
  echo "Creating missing /usr/local/Frameworks directory"
  sudo mkdir /usr/local/Frameworks
  sudo chown $(logname) /usr/local/Frameworks
fi

# Test to see if homebrew is installed, if not install it
if [ ! $(which brew) ]; then
  echo "Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
  echo "Homebrew already installed, skipping installation"
fi

cat <<END_OF_HEREDOC

Next up we are going to install all the apps.
For command line apps we will use brew.
For gui apps that are not on the app store we use brew cask.

END_OF_HEREDOC


if ask "Would you like to update and upgrade apps first?" Y; then
  echo "Updating and installing brew/cask apps"
  # Update recipies
  brew update

  # Update installed formulae
  brew upgrade
fi
if ask "Would you like to check/update brew/cask dependencies?" Y; then
  echo -e "\nChecking brew dependencies..."
  # Checking brew apps are up to date with Brewfile list,
  # "> /dev/null 2>&1" suppresses STDOUT and STDERR so they
  # are not printed out to the user
  if brew bundle check --file=$ROOTDIR/brewfiles/Brewfile > /dev/null 2>&1; then
    echo "Brew dependencies up to date"
  else
    echo "Brew dependencies missing" 
    if ask "Would you like to install cli apps with brew?" Y; then
      brew bundle --file=$ROOTDIR/brewfiles/Brewfile
    fi
  fi

  echo -e "\nChecking cask dependencies..."
  if brew bundle check --file=$ROOTDIR/brewfiles/Caskfile > /dev/null 2>&1; then
    echo "Cask dependencies up to date"
  else
    echo "Cask dependencies missing" 
    if ask "Would you like to install gui apps with cask?" Y; then
      # using "|| true", because an app may already be installed and we shouldn't stop the script
      brew bundle --file=$ROOTDIR/brewfiles/Caskfile || true
    fi
  fi
fi

if ask "Would you like to cleanup unused brew / cask?" Y; then
  # Clean up brew, the '-s' option clears the cache, including latest versions
  brew cleanup -s
fi
