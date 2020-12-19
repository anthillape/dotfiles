#!/bin/bash

set -euo pipefail

source ./util.sh

getRootDir

KARABINER_JSON=~/.config/karabiner/karabiner.json
if [[ -L $KARABINER_JSON && "$(readlink $KARABINER_JSON)" = "$ROOTDIR/karabiner.json" ]]; then
  echo "karabiner already symlinked, taking no action"
else
  if ask "Would you like to symlink karabiner config?" Y; then
    if [ -f $KARABINER_JSON ]; then
      echo 'backing up karabiner.json'
      mv $KARABINER_JSON $KARABINER_JSON.bak
    else
      mkdir -p ~/.config/karabiner
    fi
    echo 'symlinking karabiner.json'
    ln -sf $ROOTDIR/karabiner.json $KARABINER_JSON
    echo 'restarting karabiner daemon'
    launchctl stop org.pqrs.karabiner.karabiner_console_user_server
    launchctl start org.pqrs.karabiner.karabiner_console_user_server
  fi
fi

SLATE=~/.slate
if [[ -L $SLATE && "$(readlink $SLATE)" = "$ROOTDIR/slate" ]]; then
  echo "slate already symlinked, taking no action"
else
  if ask "Would you like to symlink slate config?" Y; then
    if [ -f $SLATE ]; then
      echo "Backing up .slate"
      mv $SLATE $SLATE.bak
    fi
    echo "Symlinking .slate"
    ln -sf $ROOTDIR/slate $SLATE
  fi
fi
