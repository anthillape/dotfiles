" Set true colours
set termguicolors

" Specify plugin for directories
call plug#begin('~/.local/share/nvim/plugged')

" Define plugins
Plug 'whatyouhide/vim-gotham'

" Initialise plugins
call plug#end()

colorscheme gotham
