#!/bin/bash

set -euo pipefail

source ./util.sh

getRootDir

NVIM=~/.config/nvim/init.vim

if [[ -L $NVIM && "$(readlink $NVIM)" = "$ROOTDIR/nvim/init.vim" ]]; then
  echo "nvim already symlinked, taking no action"
else
  if ask "Would you like to symlink nvim config?" Y; then

    if [ -f $NVIM ]; then
      echo "Backing up init.vim"
      mv $NVIM $NVIM.bak
    else
      mkdir -p ~/.config/nvim
    fi
    echo "Symlinking init.vim"
    ln -sf $ROOTDIR/nvim/init.vim $NVIM
  fi
fi

PLUG=~/.local/share/nvim/site/autoload/plug.vim
if [[ -f $PLUG ]]; then
  echo "Vim plug already installed, taking no action"
else
  if ask "Would you like to install vim plug" Y; then
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    # Install plugins
    command nvim +PlugInstall +qall
  fi
fi


RUBY_VERSION=2.7.2
# We need ruby to support neovim plugins that use ruby, this requires
# the ruby neovim provider to be setup and the neovim ruby gem
# to be installed.

# Check that desired version of ruby is installed
if [[ ! $(rbenv versions | grep $RUBY_VERSION) ]]; then
  if ask "Would you like to install ruby version $RUBY_VERSION?" Y; then
    # --verbose because this can take a while and without it
    # there would be no feeback that anything is happening
    echo "Installing ruby version $RUBY_VERSION"
    rbenv install $RUBY_VERSION --verbose
  fi
else
  echo "Ruby version $RUBY_VERSION already installed, taking no action"
fi

# Check that global ruby version is set correctly
if [[ ! ($(rbenv global) = $RUBY_VERSION) ]]; then
  if ask "Would you like to set global ruby version to $RUBY_VERSION?" Y; then
    echo "Setting global ruby version in ~/.rbenv/version"
    rbenv global $RUBY_VERSION
    rbenv rehash
  fi
else
  echo "Ruby version already set to $RUBY_VERSION, taking no action"
fi

# Check that the ruby neovim library is available
if [[ ! $(gem which neovim) ]]; then
  if ask "Would you like to install the ruby neovim module?" Y; then
    gem install neovim
  fi
else
  echo "Ruby neovim module already installed, taking no action"
fi

NODE_VERSION=14.15.2
# Load nvm into this shell
# The nvm.sh script contains unbound variables so we use `set +u`
# to disable checks for these that would cause the script to
# bail out.
set +u
source ~/.nvm/nvm.sh
# Check that correct node version is installed
if [[ ! $(nvm version v$NODE_VERSION) = v$NODE_VERSION ]]; then
  if ask "Would you like to install node $NODE_VERSION?" Y; then
    echo "Installing node version $NODE_VERSION"
    nvm install $NODE_VERSION
  fi
else
  echo "Node version $NODE_VERSION already installed, taking no action" 
fi

# Make sure the shell is using the correct version of node
if [[ ! $(nvm current) = v$NODE_VERSION ]]; then
  if ask "Would you like to switch to node $NODE_VERSION?" Y; then
    echo "Using node version $NODE_VERSION"
    nvm use $NODE_VERSION
  fi
else
  echo "Node version $NODE_VERSION already in use, taking no action" 
fi

# Switch unbound variable checks back on as we are done with nvm
set -u

if [[ ! $(yarn global list | grep neovim) ]]; then
  if ask "Would you like to install the node neovim module?" Y; then
    yarn global add neovim
  fi
else
  echo "Node neovim module already installed, taking no action"
fi

# Install python3 for neovim plugins
PYTHON3_VERSION=3.9.0

# Check that desired version of python3 is installed
if [[ ! $(pyenv versions | grep $PYTHON3_VERSION) ]]; then
  if ask "Would you like to install python version $PYTHON3_VERSION?" Y; then
    # --verbose because this can take a while and without it
    # there would be no feeback that anything is happening
    echo "Installing python version $PYTHON3_VERSION"
    pyenv install $PYTHON3_VERSION --verbose
  fi
else
  echo "Python version $PYTHON3_VERSION already installed, taking no action"
fi

# Create virtualenv for python3 
PYTHON3_VIRTUALENV=neovim3
if [[ ! $(pyenv virtualenvs | grep $PYTHON3_VIRTUALENV) ]]; then
  if ask "Would you like to install python3 virtualenv?" Y; then
    pyenv virtualenv $PYTHON3_VERSION $PYTHON3_VIRTUALENV
  fi
else
  echo "$PYTHON3_VIRTUALENV already exists, taking no action"
fi

# Install python3 neovim module
# Enter the neovim3 virtualenv
set +u
source ~/.pyenv/versions/$PYTHON3_VIRTUALENV/bin/activate 
set -u
if [[ ! $(pip show neovim) ]]; then
  if ask "Would you like to install neovim module for python3?" Y; then
    echo "Installing neovim to $PYTHON3_VIRTUALENV virtualenv"
    pip install neovim
  fi
else
  echo "neovim already installed to $PYTHON3_VIRTUALENV, taking no action"
fi

# Deactivate python env
set +u
source deactivate > /dev/null 2>&1
set -u