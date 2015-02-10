set nocompatible

" load pathogen
execute pathogen#infect()

" syntax highlighting
syntax on
colorscheme vividchalk

" indenting for ruby
set autoindent
set nosmartindent
set expandtab
set shiftwidth=2
set softtabstop=2

" hide buffers, don't close
set hidden

" show line numbers
set number

" terminal title
set title

set history=1000
set undolevels=1000

" enter/exit paste mode
set pastetoggle=<F2>

set mouse=a

" nerdtree configs

" close vim if last tab is nerdtree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" start with nerdtree open
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:nerdtree_tabs_open_on_console_startup=1

" alias bbye to \q
nnoremap <Leader>q :Bdelete<CR>

" window navigation shortcuts
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" put swap files, etc in .vim folder
set dir=~/.vim/_swap//
set backup
set backupdir=~/.vim/_backup/,~/tmp,.
set undofile
set undodir=~/.vim/_undo/
