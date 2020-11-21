" Set true colours
set termguicolors

" Set hard tabs to two characters in width
set tabstop=2

" Set line numbers on by default
set number

" Hide the -- INSERT -- message when in insert mode as it is in lightline
set noshowmode

" Specify ruby provider for plugins
let g:ruby_host_prog = '~/.rbenv/versions/2.6.4/bin/neovim-ruby-host'
 
" Specify node provider for plugins
let g:node_host_prog = '/usr/local/bin/neovim-node-host'

" Specify python3 provider for plugins
let g:python3_host_prog = $PYENV_ROOT . '/versions/neovim3/bin/python'

" Eliminate Esc delay, this will only work if there
" are no mappings beginning with Esc
set timeoutlen=1000 ttimeoutlen=0

" Specify plugin for directories
call plug#begin('~/.local/share/nvim/plugged')

" ---- Define plugins ----

" Light weight status line
Plug 'itchyny/lightline.vim'

" Theme for lightline
Plug 'anthillape/lightline-material-monokai'

" Display buffers
Plug 'mgee/lightline-bufferline'

" Language pack
Plug 'sheerun/vim-polyglot'

" Add theme
Plug 'skielbasa/vim-material-monokai'

" Sensible defaults
Plug 'tpope/vim-sensible'

" Improvements to netrw built in file browser
Plug 'tpope/vim-vinegar'

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

" Detect tabs in file / project
Plug 'tpope/vim-sleuth'

" Allow repeating with . for vim-surround and vim-commentary (and others)
Plug 'tpope/vim-repeat'

" Read editorconfig
Plug 'editorconfig/editorconfig-vim'

" Add fuzzy find plugin
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Add commands to kill buffers without killing their windows
Plug 'qpkorr/vim-bufkill'

" Use al (a line), and il (inner line) text objects for yanking lines without
" whitespace
Plug 'kana/vim-textobj-user' | Plug 'kana/vim-textobj-line'

" Initialise plugins
call plug#end()

let g:lightline = {
  \ 'colorscheme': 'monokai_material',
  \ 'active': {
  \   'right': [ 
  \     [ 'lineinfo' ],
  \     [ 'percent' ],
  \     [ 'fileencoding', 'filetype' ]
  \   ]
  \   }
  \ }

" Bufferline / lightline integration
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}

" Show ordinal numbers in buffer tabs
let g:lightline#bufferline#show_number = 2

" Show buffer line if more than one buffer
let g:lightline#bufferline#min_buffer_count = 2

" Split right and below
set splitbelow
set splitright

syntax enable

" Show whitespace markers by default
set list

" Sets relative line numbers on for current buffer
:set number relativenumber

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" Auto install missing plugins
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

" Colour scheme settings
set background=dark
colorscheme material-monokai
let g:materialmonokai_italic=1
let g:materialmonokai_subtle_spell=1
let g:materialmonokai_custom_lint_indicators=1

" Toggle and highlight spaces, tabstops and EOLs
set listchars=tab:▸\ ,eol:¬,space:·
highlight NonText ctermfg=1 guifg=#3B4252
highlight SpecialKey ctermfg=1 guifg=#3B4252

" Leader key should be space
let mapleader = "\<Space>"

" ---- Mappings ----
" Stop leader key from moving cursor
nnoremap <SPACE> <Nop>
" Reload vimrc
nnoremap <leader>r :source $MYVIMRC<CR>
" Toggle whitespace markers
nnoremap <leader>l :set list!<CR>
" Run ale fixers
" Open vertical / horizontal splits
nnoremap <leader>v :vnew<CR>
nnoremap <leader>h :new<CR>
" Open file explorer netrw
nnoremap <leader>e :Explore<CR>
" Run flow
nnoremap <leader>f :FlowMake<CR>
" Next / Prev buffer
nnoremap <leader>n :bn<CR>
nnoremap <leader>p :bp<CR>
" Last buffer opened
nnoremap <leader>- :e#<CR>
" Toggle color highlighting
nnoremap <leader>c :ColorToggle<CR>

" Go to numbered buffer tab (using the small superscript number
" not the actual buffer number)
nmap <leader>1 <Plug>lightline#bufferline#go(1)
nmap <leader>2 <Plug>lightline#bufferline#go(2)
nmap <leader>3 <Plug>lightline#bufferline#go(3)
nmap <leader>4 <Plug>lightline#bufferline#go(4)
nmap <leader>5 <Plug>lightline#bufferline#go(5)
nmap <leader>6 <Plug>lightline#bufferline#go(6)
nmap <leader>7 <Plug>lightline#bufferline#go(7)
nmap <leader>8 <Plug>lightline#bufferline#go(8)
nmap <leader>9 <Plug>lightline#bufferline#go(9)

" Close buffer
nnoremap <leader>x :BD<CR>

" Help should open in a vertical split to the right
cabbrev h vert bo h

" Use system clipboard as default register
set clipboard^=unnamed
