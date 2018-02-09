HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
unsetopt beep
bindkey -v
zstyle :compinstall filename '/Users/arthurcomben/.zshrc'
autoload -Uz compinit
compinit

export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

if ! zplug check; then
    zplug install
fi

zplug mafredri/zsh-async, from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
zplug load
