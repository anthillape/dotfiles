# Installs macOS apps using brew, brew cask, and mas
# Usage `brew bundle Caskfile`
cask_args appdir: "/Applications"

# Add formulae repositories
tap "homebrew/core"
tap "homebrew/bundle"
tap "caskroom/fonts"
tap "caskroom/cask"

# Add cask, for installing non-cli apps that are not on the app store
brew "cask"

# Add fuzzy finder, which can later be used in vim to open files in a dir
brew "fzf"

# Replace builtin macos sed with gnu-sed
brew "gnu-sed", args: ["with-default-names"]

# Replace system git
brew "git"

# Replace system grep
brew "grep"

# Add mas-cli, which installs app store apps 
brew "mas"

# Add mongodb
brew "mongodb"

# Add neovim, a refactored, async vim
brew "neovim"

# Add nvm (better multi env support than n)
brew "nvm"

# Add ruby version manager
brew "rbenv"

# Add python version manager
brew "pyenv"

# Add pyenv / virtualenv integration 
brew "pyenv-virtualenv", args: ["--HEAD"]

# Add wrapper to let tmux use pbcopy and pbpaste
brew "reattach-to-user-namespace"

# Add find-in-file functionality
brew "the_silver_searcher"

# Add simplified man page util
brew "tldr"

# Add terminal multiplexer
brew "tmux"

# Add app to show n deep directory hierarchies
brew "tree"

# Replace vim
brew "vim", args: ["with-override-system-vi"]

# Add file watchers 
brew "watch"
brew "watchman"

# Add file downloader
brew "wget"

# Add npm replacement yarn
brew "yarn", args: ["without-node"]

# Add zsh plugin manager
brew "zplug"

# Add z shell
brew "zsh"

# Add iterm
cask "iterm2"

# Add nerd font patched meslo fonts
cask "caskroom/fonts/font-meslo-nerd-font-mono"

# Add caffeine, app to stop mac going to sleep
cask "caffeine"

# Add dropbox
cask "dropbox"

# Add flux, which warms screen colours at night
cask "flux"

# Add imageoptim, image file size reducer
cask "imageoptim"

# Add kakapo, an ambient sound mixer / player
cask "kakapo"

# Add karabiner-elements (the karabiner cask is old
cask "karabiner-elements"

# Add little snitch, to keep an eye on your network
cask "little-snitch"

# Add slate, a window position manager
cask "slate"

# Add some browsers for testing
cask "firefox"
cask "google-chrome"

# Add some app store apps
mas "1Password", id: 443987910
mas "iA Writer", id: 775737590
mas "Soulver", id: 413965349
mas "Todoist", id: 585829637

