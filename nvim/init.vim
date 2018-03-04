" Set true colours
set termguicolors

" Set indentation to two spaces
set expandtab
set shiftwidth=2
set softtabstop=2

" Specify ruby provider for plugins
let g:ruby_host_prog = '~/.rbenv/versions/2.5.0/bin/neovim-ruby-host'

" Specify node provider for plugins
let g:node_host_prog = '/usr/local/bin/neovim-node-host'

" Specify python2 provider for plugins (seems to require full path)
let g:python_host_prog = $PYENV_ROOT . '/versions/neovim2/bin/python'

" Specify python3 provider for plugins (seems to require full path)
let g:python3_host_prog = $PYENV_ROOT . '/versions/neovim3/bin/python'


" Specify plugin for directories
call plug#begin('~/.local/share/nvim/plugged')

" ---- Define plugins ----

" Set visual theme
Plug 'whatyouhide/vim-gotham'

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


" Initialise plugins
call plug#end()

colorscheme gotham
