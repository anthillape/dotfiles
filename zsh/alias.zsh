
# Whenever we open tmux we want to make sure it sets the TERM variable that is 
# used for tmux, rather than inherit the one used for iterm2, ie xterm-256color
# we only want this for tmux, and not iterm2, hence the use of an alias
# rather than export
alias term='TERM=screen-256color tmux'

alias l='ls -al'
alias ls='ls -GFh' # Colorize output, add file type indicator, and put sizes in human readable format
alias ll='ls -GFhl' # Same as above, but in long listing format

alias vi='nvim'
alias vim='nvim'

alias md='mkdir -p'
alias rd='rmdir'
alias d='dirs -v' # List last used directories

