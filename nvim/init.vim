" Set true colours
set termguicolors

" Set indentation to two spaces
set expandtab
set shiftwidth=2
set softtabstop=2

" Specify plugin for directories
call plug#begin('~/.local/share/nvim/plugged')

" Define plugins
Plug 'whatyouhide/vim-gotham'

" Initialise plugins
call plug#end()

colorscheme gotham
