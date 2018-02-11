### SET OPTIONS ###

## General ##

# Allow cd to directory with just directory name
setopt auto_cd

# Switch of audible beep on error
setopt no_beep

# Where argument to cd is a cd-able variable, go there 
setopt cdablevarS

# Enable param and arithmetic expansion, and command substitution
setopt prompt_subst

# Allow multiple redirection
# eg. Send STDOUT of one process to STDIN of several processes
# $ process1 > >(process1) > >(process2)
# eg. Redirect STDERR twice
# $ program 2> file2 > file1 2>&1
setopt multios

## History ##

# Ignore duplicate directories into history
setopt pushd_ignore_dups

# Append events to the history file rather than overwriting 
setopt append_history

# Share history across terminals
setopt share_history

# Timestamped history
setopt extended_history

# Add commands as they are typed
setopt inc_append_history

# Save unique history longer, ie. when $HISTSIZE is reached, clear out dups first 
setopt hist_expire_dups_first

# Do not add duplicates of the previous event to history
setopt hist_ignore_dups

# Ignore lines with a leading space so you can selectively not add things to history
setopt hist_ignore_space

## Completion ##

# Completion always takes you to the end of the word
setopt always_to_end

# Show completion on successive tab press. Needs unsetopt menu_complete
setopt auto_menu

# Allow completion from within a word
setopt complete_in_word

# Do not autoselect the first completion entry
unsetopt menu_complete

## Correction ##

# Switch off correction for arguments
unsetopt correct_all

# Switch on correction for commands
setopt correct


