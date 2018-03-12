" Set true colours
set termguicolors

" Set indentation to two spaces
set expandtab
set shiftwidth=2
set softtabstop=2

" Set line numbers on by default
set number

" Specify ruby provider for plugins
let g:ruby_host_prog = '~/.rbenv/versions/2.5.0/bin/neovim-ruby-host'

" Specify node provider for plugins
let g:node_host_prog = '/usr/local/bin/neovim-node-host'

" Specify python2 provider for plugins
let g:python_host_prog = $PYENV_ROOT . '/versions/neovim2/bin/python'

" Specify python3 provider for plugins
let g:python3_host_prog = $PYENV_ROOT . '/versions/neovim3/bin/python'


" Specify plugin for directories
call plug#begin('~/.local/share/nvim/plugged')

" ---- Define plugins ----

" Set visual theme
Plug 'whatyouhide/vim-gotham'

" Sensible defaults
Plug 'tpope/vim-sensible'

" Add simple editing of surrounding quotes, tags, brackets etc
" cs'" replaces surrounding ' with "
" cst" replaces surrounding tag (eg <p>) with "
" ds[ removes surrounding [ and padding
" ds] removes surrounding [ only
" ysiw<em> surround the word the cursor is over with em tag
Plug 'tpope/vim-surround'

" Add simple commenting with gc (g does nothing here except namespace the c)
" gcc comments / uncomments a line
" gcgc uncomments a set of comments
Plug 'tpope/vim-commentary'

" Allow repeating with . for vim-surround and vim-commentary (and others)
Plug 'tpope/vim-repeat'

" Add fuzzy find plugin
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" https://medium.com/usevim/what-is-modern-vim-2591f6b1ec04
" Plug 'roxma/nvim-completion-manager'
" Plug 'roxma/nvim-cm-tern', {'do': 'npm install'}

" Allow use of tmux pane navigation shortcuts to work in vim splits
Plug 'christoomey/vim-tmux-navigator'

" Initialise plugins
call plug#end()

" Auto install missing plugins

autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

colorscheme gotham
