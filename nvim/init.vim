" Set true colours
set termguicolors

" Set hard tabs to two characters in width
set tabstop=2

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

" Add vim airline fancy status line
Plug 'vim-airline/vim-airline'

" Add snazzy theme
Plug 'arcticicestudio/nord-vim'

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

" Detect tabs in file / project
Plug 'tpope/vim-sleuth'

" Allow repeating with . for vim-surround and vim-commentary (and others)
Plug 'tpope/vim-repeat'

" Read editorconfig
Plug 'editorconfig/editorconfig-vim'

" Add fuzzy find plugin
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Show git status in gutter
Plug 'airblade/vim-gitgutter'

" Add indentation guides
Plug 'nathanaelkane/vim-indent-guides'

" Allow use of tmux pane navigation shortcuts to work in vim splits
Plug 'christoomey/vim-tmux-navigator'

" Ale async linter
Plug 'w0rp/ale'

" Deoplete autocompletion framework, adds autocomplete dropdown
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Add flow support in deoplete
Plug 'wokalski/autocomplete-flow'

" Function argument completion with flow and deoplete
" Plug 'Shougo/neosnippet'
" Plug 'Shougo/neosnippet-snippets'

" Javascript highlighting
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'mxw/vim-jsx'
Plug 'othree/javascript-libraries-syntax.vim'

" CSS highlighting
Plug 'ap/vim-css-color'
Plug 'JulesWang/css.vim'

" Initialise plugins
call plug#end()

let g:ale_fixers = {
  \ 'javascript': ['prettier_eslint'],
  \ }

" Split right and below
set splitbelow
set splitright

syntax enable

" Enable powerline fonts in vim airline
let g:airline_powerline_fonts = 1

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

set background=dark
colorscheme nord

" Toggle and highlight spaces, tabstops and EOLs
set listchars=tab:▸\ ,eol:¬,space:·
highlight NonText ctermfg=1 guifg=#3B4252
highlight SpecialKey ctermfg=1 guifg=#3B4252

" Leader key should be space
let mapleader = "\<Space>"

" Mappings
nmap <leader>so :source $MYVIMRC<CR>
nmap <leader>l :set list!<CR> " toggle whitespace chars
nmap <leader>d <Plug>(ale_fix)
nmap <leader>v :vsplit new <CR>
nmap <leader>h :split new <CR>
nmap <leader>r :source $MYVIMRC <CR>
nmap <leader>e :Explore <CR>

" Fzf
nnoremap <C-T> :FZF<CR>
inoremap <C-T> <ESC>:FZF<CR>i

" Prettier options

let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1


