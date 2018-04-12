
# Whenever we open tmux we want to make sure it sets the TERM variable that is
# used for tmux, rather than inherit the one used for iterm2, ie xterm-256color
# we only want this for tmux, and not iterm2, hence the use of an alias
# rather than export
alias term='TERM=screen-256color tmux'

alias reload=". ~/.zshrc && echo 'zsh config reloaded'"

# All entries except dots, single column, file type indicator, colourised
alias l='ls -A1FG'
# Colorize output, add file type indicator, and put sizes in human readable format
alias ls='ls -GFh'
# Same as above, but in long listing format
alias ll='ls -GFhl'

alias vi='nvim'

alias md='mkdir -p'
alias rd='rmdir'
alias d='dirs -v' # List last used directories

alias serve='python -m SimpleHTTPServer'
