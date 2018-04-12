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

" Show git status in gutter
Plug 'airblade/vim-gitgutter'

" Add commands to kill buffers without killing their windows
Plug 'qpkorr/vim-bufkill'

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

" Add flow typecheck on save
Plug 'flowtype/vim-flow', {
  \ 'autoload': {
  \   'filetypes': 'javascript'
  \ }}

" Add typescript code completion, type signatures
Plug 'mhartington/nvim-typescript', { 'do': ':UpdateRemotePlugins' }

" Function argument completion with flow and deoplete
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

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
  \ 'typescript': ['prettier','tslint'],
  \ }

" Split right and below
set splitbelow
set splitright

syntax enable

" Enable powerline fonts in vim airline
let g:airline_powerline_fonts = 1

" Only open quickfix window for flow if there are flow errors
let g:flow#autoclose = 1

" Disable omnifunc completion with flow as we use deoplete for this
let g:flow#omnifunc = 0

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
let g:airline_theme='materialmonokai'

" Enable airline buffer line using numbered straight tabs
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1

" Toggle and highlight spaces, tabstops and EOLs
set listchars=tab:▸\ ,eol:¬,space:·
highlight NonText ctermfg=1 guifg=#3B4252
highlight SpecialKey ctermfg=1 guifg=#3B4252

" Enable deoplete auto completion
let g:deoplete#enable_at_startup = 1

" Enable neosnippet
let g:neosnippet#enable_completed_snippet = 1

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
nmap <leader>d <Plug>(ale_fix)
" Open vertical / horizontal splits
nnoremap <leader>v :vsplit new<CR>
nnoremap <leader>h :split new<CR>
" Open file explorer netrw
nnoremap <leader>e :Explore<CR>
" Run flow
nnoremap <leader>f :FlowMake<CR>
" Next / Prev buffer
nnoremap <leader>n :bn<CR>
nnoremap <leader>p :bp<CR>
" Last buffer opened
nnoremap <leader>- :e#<CR>
" Go to numbered buffer tab (using the small superscript number
" not the actual buffer number)
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
" Close buffer
nnoremap <leader>x :BD<CR>
" Fuzzy finding
nnoremap <leader>t :FZF<CR>

" Prettier options

let g:ale_javascript_prettier_use_local_config = 1


