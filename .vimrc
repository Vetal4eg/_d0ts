set nocompatible
filetype off

let $PATH = $PATH . ':' . expand("~/.local/bin")

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Main
  Plugin 'tpope/vim-surround'
  Plugin 'Yggdroot/indentLine'
  Plugin 'bling/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'tpope/vim-repeat'


" Navigation
  Plugin 'rking/ag.vim'
  Plugin 'corntrace/bufexplorer'
  Plugin 'kien/ctrlp.vim'
  Plugin 'dockyard/vim-easydir'
  Plugin 'scrooloose/nerdtree'

  Plugin 'scrooloose/syntastic'

" Programming
  Plugin 'elzr/vim-json'

" js group
  Plugin 'mxw/vim-jsx'
  Plugin 'pangloss/vim-javascript'

" Markup
  Plugin 'plasticboy/vim-markdown'
  Plugin 'stephpy/vim-yaml'

" Color schemes
  Plugin 'cocopon/iceberg.vim'

" Ruby group
  Plugin 'vim-ruby/vim-ruby'
  Plugin 'slim-template/vim-slim'
  Plugin 'tpope/vim-haml'
  Plugin 'tpope/vim-rails'
  Plugin 'tpope/vim-rake'
  Plugin 'tpope/vim-bundler'
  Plugin 'tpope/vim-endwise'
  Plugin 'sunaku/vim-ruby-minitest'
  Plugin 'Shougo/vimshell.vim'

" tmux group
  Plugin 'jgdavey/tslime.vim'
  Plugin 'jpalardy/vim-slime'

call vundle#end()

filetype plugin indent on

let mapleader=","

" Sets how many lines of history VIM has to remember
set history=800

" Configure backspace so it acts as it should act
set backspace=eol,start,indent

" enhanced command completion
set wildmenu

set visualbell

if has('mouse')
  set mouse=a
endif

" Don't redraw while executing macros (good performance config)
set lazyredraw

set cursorline
set hidden
set nofoldenable
"set encoding=utf-8
set nowrap
set number
set hlsearch
set ignorecase
set smartcase

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" set autoindent
" set smartindent
" set softtabstop=4
set expandtab
" set noexpandtab
set softtabstop=2
set shiftwidth=2
" set smarttab

" Color Scheme
set guifont=Inconsolata\ LGC\ 14
colo iceberg

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0

let g:syntastic_check_on_wq = 0

let g:jsx_ext_required = 0

" let g:slime_target = "tmux"

let g:vim_json_syntax_conceal = 0

let g:easytags_async = 1

" Automatically removing all trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

let g:buffergator_viewport_split_policy = "B"
let g:buffergator_sort_regime = "mru"

let g:vim_markdown_folding_disabled = 1

let g:syntastic_haskell_checkers = ['']

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_haml_checkers = ['haml_lint']
let g:syntastic_ruby_checkers = ['rubocop', 'mri']
let g:syntastic_erlang_checkers = ['syntaxerl', 'escript']

nmap <F8> :TagbarToggle<CR>
nnoremap <F5> :UndotreeToggle<cr>

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

" Toggle paste mode
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

" format the entire file
nnoremap <leader>fef :normal! gg=G``<CR>

" set text wrapping toggles
nmap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>

" find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

nmap <C-\> :NERDTreeFind<CR>
nmap <silent> <leader><leader> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

nmap <silent> // :nohlsearch<CR>
noremap ,hl :set hlsearch! hlsearch?<CR>

" Allows you to enter sudo pass and save the file
" " when you forgot to open your file with sudo
cmap w!! %!sudo tee > /dev/null %

" Allow to copy/paste between VIM instances
" "copy the current visual selection to ~/.vbuf
vmap <Leader>y :w! ~/.vbuf<CR>
" "copy the current line to the buffer file if no visual selection
nmap <Leader>y :.w! ~/.vbuf<CR>
" "paste the contents of the buffer file
nmap <Leader>p :r ~/.vbuf<CR>

au BufRead,BufNewFile {Vagrantfile,Gemfile,Capfile} set ft=ruby

" autocmd FileType ruby compiler ruby

if filereadable(expand("~/.vimrc.after"))
  source ~/.vimrc.after
endif

" Disable Arrow keys in Escape mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
