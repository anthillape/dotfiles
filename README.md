# dotfiles

These are my dotfiles. They are heavily geared towards frontend dev on macOS with neovim.  
Use them at your own peril!

### Installation

There are two scripts, one sets a bunch of macOS preferences, the other installs everything else.

Make the install / setup-macos scripts executable with
```
chmod u+x install setup-macos
```
then run install
```
./install
```
and follow the on screen instructions.  
The script will usually test to see if something is already installed / configured, and if not will ask you if you want to go ahead with the change it is about to make. So far you pretty much need to say yes to everything for it to work, but longer term I'd like for it to be able to prevent features from being installed if their pre-requisites aren't available or are misconfigured.

In short the script will: install command line tools, brew, a bunch of brew / cask / mas-cli apps (see the brewfiles directory for specifics), set zsh as default shell, install the 'pure' theme with async, install tmux plugins, create mongo db, set karabiner up for shortcuts and hotkeys, set up slate for gui window management, set up an ssh config, symlink dotfiles and back up originals, set up nvim with python2, python3, ruby, and node plugin support, plus version and environment management for each. 

## iTerm2

To get your iterm config working you need to open preferences > general.  
At the bottom check 'Load preferences from a custom folder or URL'.  
This should open a file open dialog, here select the file
`iterm2/com.googlecode.iterm2.plist` in this repo.

### Stack

- brew
- iterm2 (considering hyper)
- zsh / zplug
- tmux / tpm
- neovim / vimplug
- yarn
- nvm
- pyenv
- virtualenv
- rbenv

### Style

- Meslo with nerd font extensions
- Pure theme for zsh
- Monokai Material colours

### Notes

- Caps lock will be set to the Esc key, and will function as left-CTRL if you hold it and press another key.
- The prefix key for tmux is CTRL-S
- To move / resize GUI windows use CTRL-ALT-LEFT/RIGHT/UP (left half/right half/full screen)
- To use the arrow keys with hjkl, hold right CMD
- Moving between tmux panes and vim splits is done with CTRL hjkl
- Resizing tmux panes is done with CTRL-S SHIFT-H/J/K/L, and HJKL are repeatable

### Keeping up to date

Fetch newest version of homebrew (also runs automatically when you run `brew upgrade`
`brew update`
Upgrade installed brews with original options
`brew upgrade`
Upgrade casks
`brew cask upgrade`
Update all zsh plugins with zplug
`zplug update`
Update neovim plugins with vim-plug
In nvim `:PlugUpdate`

### Health checks

brew
`brew doctor`
brew cask
`brew cask doctor`
neovim
`:checkhealth`

### Caveats

- The karabiner config will not remain symlinked if you update it via the karabiner app

### Inspiration

- William Durand https://github.com/willdurand
- Joshua Steele https://github.com/joshukraine
- Richard van den Brand https://github.com/ricbra
- Mathias Bynens https://github.com/mathiasbynens
- Gianni Chiappetta https://github.com/gf3
- Ham Vocke http://www.hamvocke.com/
- Brian P.Hogan http://bphogan.com/
- Deian Isac https://medium.com/@deianisac/
- Mark Nichols https://github.com/zanshin
- Junegunn Choi https://github.com/junegunn
- Ben Smith https://github.com/hellosmithy
- Kien Luu https://github.com/kienluu
