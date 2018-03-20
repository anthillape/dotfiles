# dotfiles
My dotfiles

A work in progress. These are / will be geared towards frontend dev, but should not previen effective development in ruby / python / node.
Focus is on clear documentation and user feedback.
The install scripts should do everything you need, and will guide you through the process.
Unfotunately there remain some manual steps, but these should get ironed out as I learn more about shell / vim scripting.

### Installation

Make install runnable with
```
chmod u+x install
```
then run install
```
./install
```
and follow the on screen instructions.
The script will usually test to see if something is already installed / configured, and if not will ask you if you want to go ahead with the change it is about to make. So far you pretty much need to say yes to everything for it to work, but I intend, longer term for it to be able to prevent features from being installed if their pre-requisites aren't available or are misconfigured.

## Iterm

To get your iterm config working you need to open preferences > general.
At the bottom check 'Load preferences from a custom folder or URL'
This should open a file open dialog, here select the file
`iterm2/com.googlecode.iterm2.plist` in this repo.

### Stack

zsh
zplug
tmux
neovim
vimplug
yarn
nvm
pyenv
virtualenv
rbenv

### Style

Meslo with nerd font extensions
Pure theme
Nord colours
Vim Airline

### Notes

- Caps lock will be set to the Esc key, and will function as left-CTRL if you hold it and press another key.
- The prefix key for tmux is CTRL-S
- To move / resize GUI windows use CTRL-ALT-LEFT/RIGHT/UP (left half/right half/full screen)
- To use the arrow keys with hjkl, hold right CMD
- Moving between tmux panes is done with CTRL hjkl
- Resizing tmux panes is done with CTRL-S HJKL, and HJKL are repeatable

### Inspiration, tutorials, comments, thanks and shameless plagiarism
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
