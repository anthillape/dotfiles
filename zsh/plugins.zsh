### LOAD PLUGINS ###

# Add sensible defaults
zplug "tmux-plugins/tmux-sensible"

# Load nvm (brew nvm has issues with npm)
# This should be loaded early in case other plugins require it
zplug "lukechilds/zsh-nvm"

# Add async for the pure theme
zplug "mafredri/zsh-async", from:github

# Add plugin that tells you if a command you wrote already has an alias
zplug "MichaelAquilina/zsh-you-should-use"

# Add improved completion
zplug "bil-elmoussaoui/flatpak-zsh-completion", use:flatpak, defer:2

# Add fuzzy finder integration
zplug "junegunn/fzf", use:"shell/*.zsh"
zplug "junegunn/fzf-bin", from:gh-r, as:command, rename-to:fzf

# Add additional completions
zplug "zsh-users/zsh-completions", defer:2

# Add fish style syntax highlighting for commands, params, strings etc
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Allow substring matches when searching history
# This must be loaded after zsh-syntax-highlighting
zplug "zsh-users/zsh-history-substring-search", defer:2

# Git plugin from ohmyzsh
zplug "plugins/git", from:oh-my-zsh

# Add oh-my-zsh style ... to go up many levels
zplug "knu/zsh-manydots-magic"

# Add fish style autosuggestions as you type
zplug "zsh-users/zsh-autosuggestions", defer:3
ZSH_AUTOSUGGEST_USE_ASYNC="true"

# Syntax highlighting for commands, load last using defer,
# defer values over 2 run after compinit (which initialises the 
# zsh "new" compsys completion system)
zplug "zsh-users/zsh-syntax-highlighting", from:github, defer:3

# Add 'pure' theme
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

zplug load
