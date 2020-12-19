#!/bin/bash

set -euo pipefail

source ./util.sh

getRootDir
SSH_DIR=~/.ssh
SSH=$SSH_DIR/config
if [[ -L $SSH && "$(readlink $SSH)" = "$ROOTDIR/ssh/config" ]]; then
  echo "ssh already symlinked, taking no action"
else
  if ask "Would you like to symlink ssh config?" Y; then
    if [ -f $SSH ]; then
      echo "Backing up .ssh/config"
      mv $SSH $SSH.bak
    fi
    if [ ! -d $SSH_DIR ]; then
      echo "Creating ssh directory"
      mkdir $SSH_DIR
    fi
    echo "Symlinking .ssh/config"
    ln -sf $ROOTDIR/ssh/config $SSH
  fi
fi