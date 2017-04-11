"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Creator:
"       Cristian A. Cardellino
"       http://crscardellino.me
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ========
" SpaceVim
" ========

" Plugin manager
let g:spacevim_plugin_manager = 'dein'

" Guifont
let g:spacevim_guifont = 'Menlo\ for\ Powerline'

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

" <leader>, <localleader> and <windowsleader>
let mapleader = "\\"
let maplocalleader = ","
let g:spacevim_windows_leader = 't'

" capital "Q" to quit all, capital "W" to write all, capital "WQ" to write and quit all
command Q :qall
command W :wall
command WQ :wall | :qall

" =================
" Buffers & Windows
" =================

" don't force close of buffers
set hidden

" buffer switching
nnoremap <localleader>n :bn<cr>
nnoremap <localleader>p :bp<cr>

" resize
nnoremap <leader>[ :vertical resize -5<cr>
nnoremap <leader>] :vertical resize +5<cr>
nnoremap <leader>{ :res -5<cr>
nnoremap <leader>} :res +5<cr>

" ==============
" Edition & Text
" ==============

" syntax highlighting
syntax on

" word wrap
set textwidth=0

" wrap paragraph
nmap <c-q> {gq}

" new line on carriage return
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
set pastetoggle=<F4>

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

" solarized dark theme setup
set background=dark
let g:spacevim_colorscheme='NeoSolarized'

" show matching brackets when text indicator is over them
set showmatch

" remove trailing whitespaces with <F5>
:nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" ======
" Moving
" ======

" treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" continue to next and previous line when moving with 'h' and 'l'
set whichwrap+=h,l 

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
