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

" Specify plugin for directories
call plug#begin('~/.local/share/nvim/plugged')

" Define plugins
Plug 'whatyouhide/vim-gotham'

" Initialise plugins
call plug#end()

colorscheme gotham
