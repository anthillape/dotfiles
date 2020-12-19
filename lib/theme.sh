#!/bin/bash

set -euo pipefail

source ./util.sh

# Symlink pure.zsh and async.zsh in $fpath so pure theme has access
if [ ! -f /usr/local/opt/zplug/repos/sindresorhus/pure/async.zsh ]; then
  echo "Symlinking async.zsh for pure theme"
  ln -s /usr/local/opt/zplug/repos/sindresorhus/pure/async.zsh /usr/local/share/zsh/site-functions/async
else
  echo "async.zsh already symlinked, taking no action"
fi

if [ ! -f /usr/local/opt/zplug/repos/sindresorhus/pure/pure.zsh ]; then
  echo "Symlinking pure.zsh"
  ln -s /usr/local/opt/zplug/repos/sindresorhus/pure/pure.zsh /usr/local/share/zsh/site-functions/prompt_pure_setup
else
  echo "pure.zsh already symlinked, taking no action"
fi

echo "Some changes may require a restart to take effect"