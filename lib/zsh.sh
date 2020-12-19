#!/bin/bash

set -euo pipefail

source ./util.sh

# Add zsh to list of valid login shells at /etc/shells 
# tee is used so we can write to a file that is owned by root
# since using sudo at the beginning would only sudo echo
# (using sudo -s in this case failed on my setup)
# Then use chsh -s to change users shell to zsh
if ! grep -Fxq /usr/local/bin/zsh /etc/shells; then
  echo "Adding homebrew zsh (usr/local/bin/zsh) to /etc/shells"
  echo /usr/local/bin/zsh | sudo tee -a /etc/shells > /dev/null
  echo "Changing default shell to zsh"
  chsh -s /usr/local/bin/zsh
else
  echo "Shell already set to zsh, taking no action"
fi

ZSH_DIR=~/.zsh
ZSHRC=~/.zshrc
ZSHENV=~/.zshenv
getRootDir

if [[ -L $ZSHRC && "$(readlink $ZSHRC)" = "$ROOTDIR/zsh/zshrc" && -L $ZSHENV && -L $ZSH_DIR ]]; then
  echo "zsh already symlinked, taking no action"
else
  if ask "Would you like to symlink zsh?" Y; then
    if [ -d $ZSH_DIR ]; then
      echo "Backing up .zsh directory"
      if [ -d $ZSH_DIR.bak ]; then
        rm -rf $ZSH_DIR.bak
      fi
      mv $ZSH_DIR $ZSH_DIR.bak
    fi
    if [ -f $ZSHRC ]; then
      echo "Backing up .zshrc"
      mv $ZSHRC $ZSHRC.bak
    fi
    if [ -f $ZSHENV ]; then
      echo "Backing up .zshenv"
      mv $ZSHENV $ZSHENV.bak
    fi

    echo "Symlinking .zsh directory"
    ln -snf $ROOTDIR/zsh $ZSH_DIR

    echo "Symlinking .zshrc"
    ln -sf $ROOTDIR/zsh/zshrc $ZSHRC

    echo "Symlinking .zshenv"
    ln -sf $ROOTDIR/zsh/zshenv $ZSHENV

    # zsh cannot be reloaded here as this is a bash script

    echo "You will need to restart / reload your shell for zsh to update"
  fi
fi