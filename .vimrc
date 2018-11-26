"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Creator:
"       Cristian A. Cardellino
"       https://crscardellino.github.io
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" =============
" Preconditions
" =============

" use vim settings, not vi settings (needed)
set nocompatible

" filetype detection off for Vundle
filetype off

" =======================
" Vundle (plugin manager)
" =======================

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" Vundle start
call vundle#begin()

" Vundle plugin, required
Plugin 'VundleVim/Vundle.vim'

" personal plugins
Plugin 'bling/vim-airline'
Plugin 'chriskempson/base16-vim'
Plugin 'vim-airline/vim-airline-themes'

" Vundle end
call vundle#end()

" required for Vundle
filetype plugin indent on

" =======
" General
" =======

" keep 500 lines of command line history
set history=100

" use 100 levels of undo
set undolevels=100

" set endline to unix-style
set ff=unix

" change the terminal's title
set title

" <leader> and <localleader>
let mapleader = ","
let maplocalleader = "\\"

" capital "Q" to quit all
command Q :qall

" capital "W" to write all
command W :wall

" capital "WQ" to write and quit all
command WQ :wall | :qall

" "Vimrc" to edit the .vimrc file
command Vimrc :tabe ~/.vimrc

" =================
" Buffers & Windows
" =================

" don't force close of buffers
set hidden

" Buffer switching
nnoremap <leader>n :bn<cr>
nnoremap <leader>p :bp<cr>

" Tab switching
nnoremap <localleader>n :tabnext<cr>
nnoremap <localleader>p :tabprevious<cr>

" Resize
nnoremap <localleader>[ :vertical resize -5<cr>
nnoremap <localleader>] :vertical resize +5<cr>
nnoremap <localleader>{ :res -5<cr>
nnoremap <localleader>} :res +5<cr>

" ==============
" Edition & Text
" ==============

" syntax highlighting
syntax on

" word wrap
set textwidth=0

" highlight column 80
set colorcolumn=80

" insert newline character
nmap <c-o> O<esc>j

" insert newline
nnoremap <cr> a<cr><esc>k$

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" size of a hard tabstop
set tabstop=4

" size of an "indent"
set shiftwidth=4

" a combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
set softtabstop=4

" make "tab" insert indents instead of tabs at the beginning of a line
set smarttab

" always uses spaces instead of tab characters
set expandtab

" don't wrap lines
set nowrap

" always set autoindenting on
set autoindent

" copy the previous indentation on autoindenting
set copyindent

" toggle pastemode
set pastetoggle=<F2>

" set new vertical splits to the right and horizontal to below
set splitright
set splitbelow

" set different tabspaces for some files
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype tex setlocal ts=2 sts=2 sw=2

" ===================
" Files & Directories
" ===================

" change the dir
set autochdir

" Remove temp files created by vim
set nobackup
set noundofile

" set to auto read when a file is changed from the outside
set autoread

" set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Ignore this files when using wildcards
set wildignore=*.swp,*.bak,*.pyc,*.class,.git/,tmp/

" set default filetypes
let g:tex_flavor = "latex"

" =========
" Interface
" =========

" show the cursor position all the time
set ruler

" display incomplete commands
set showcmd

" show line number
set number

" base16 solarized dark setup
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

set background=dark
colorscheme base16-default-dark

let g:airline_theme='base16'

hi Normal guibg=NONE ctermbg=NONE

" show matching brackets when text indicator is over them
set showmatch

" remove trailing whitespaces with <F5>
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" map \w to wrapping lines
nnoremap <localleader>w :set wrap linebreak nolist<cr>


" ======
" Moving
" ======

" treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Smart way to move between windows
map <c-j> <c-w>j:cd %:p:h<cr>:<cr>
map <c-k> <c-w>k:cd %:p:h<cr>:<cr>
map <c-h> <c-w>h:cd %:p:h<cr>:<cr>
map <c-l> <c-w>l:cd %:p:h<cr>:<cr>

" Tab to switch windows
map <tab> <c-w>w:cd %:p:h<cr>:<cr>

" continue to next and previous line when moving 
set whichwrap+=<,>,h,l,[,]

" ======
" Search
" ======

" do incremental searching
set incsearch

" highlight search results
set hlsearch

" ignore case while searching
set ignorecase

" case-sensitive is patter is not all-lowercase
set smartcase

" =======
" Plugins
" =======

" Airline
set laststatus=2
set ttimeoutlen=50

let g:airline#extensions#tabline#enabled        = 1
let g:airline#extensions#branch#enabled         = 1
let g:airline#extensions#branch#empty_message   = ''
let g:airline#extensions#syntastic#enabled      = 1
let g:airline_powerline_fonts                   = 1
