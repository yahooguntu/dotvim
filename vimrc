set nocompatible

set ttimeoutlen=50

filetype plugin on

call plug#begin('~/.vim/plugged')

" ag searching
Plug 'rking/ag.vim'

" theme
Plug 'tpope/vim-vividchalk'

" support increment/decrement for dates
Plug 'tpope/vim-speeddating'

" file tree browser
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" nice status line
Plug 'vim-airline/vim-airline'

" git integration (mostly for airline)
Plug 'tpope/vim-fugitive'

" ruby support
Plug 'vim-ruby/vim-ruby'

" nicer buffer delete (:Bdelete)
Plug 'moll/vim-bbye'

call plug#end()

" airline config
let g:airline_powerline_fonts = 1

" syntax highlighting
syntax on
set background=dark
colorscheme vividchalk
set clipboard=unnamed

set autoindent
set nosmartindent

" indenting rules
autocmd FileType ruby setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType java setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType cpp setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType yaml setlocal expandtab shiftwidth=2 softtabstop=2

" always display status line
set laststatus=2

" allow backspacing over indent, lines, and start of insert
set backspace=indent,eol,start

" underline the cursor's current line
"set cursorline

" show tab complete menu for command line
set wildmenu

" hide buffers, don't close
set hidden

" terminal title
silent !echo -e "\033];${PWD\#\#*/}\007"

set history=1000
set undolevels=1000

" grey column to remind you to use short lines
set colorcolumn=100

" enter/exit paste mode
set pastetoggle=<F2>

set mouse=a

" show intermediate commands as you type
set showcmd

" search as characters are entered
set incsearch
" highlight search results
set hlsearch

" use ag for search
"if executable('ag')
"  let g:ackprg = 'ag --vimgrep'
"endif

" use space as leader
nnoremap <SPACE> <Nop>
map <SPACE> <leader>

" map key to unhighlight all results
nnoremap <leader>n :nohlsearch<CR>

" map :,e to autofill :e with the current path prefix
cnoremap ,e e <c-r>=expand("%:h")<cr>/

" use 'Q' to apply the macro 'q'
nnoremap Q @q
vnoremap Q :norm @q<cr>

" linux xterm color support
if $TERM == 'xterm-256color'
  set t_Co=256
endif

" nerdtree configs
"let NERDTreeIgnore = ['\.wixobj$', '\.pyc$']

" NERDTreeToggle leader mapping
nnoremap <leader>f :NERDTreeToggle<CR>

" close vim if last tab is nerdtree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" start with nerdtree open
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"let g:nerdtree_tabs_open_on_console_startup=1


" alias Bdelete to \q
nnoremap <leader>q :Bdelete<CR>

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

" autocomplete settings
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

" autocomplete remap to ctrl-space
"inoremap <c-@> <c-x><c-o>

" show relative line numbers
set relativenumber
" line number for current line shows true line number
set number

" don't jump to start of line when switching between buffers
set nostartofline

" hotkey to check all files for changes on disk
function! CheckTimestampForReload()
  let buf=bufnr('%')
  exec ':bufdo :checktime'
  exec ':buffer' buf
endfunc

nnoremap <silent><leader>r :call CheckTimestampForReload()<cr>

" quickfix shortcut for next/prev
nnoremap <C-n> :cn<CR>
nnoremap <C-p> :cp<CR>

" next/prev buffer
nnoremap <silent><leader>[ :bp<CR>
nnoremap <silent><leader>] :bn<CR>

" enable vim-airline buffer bar
"let g:airline#extensions#tabline#enabled = 1

"
" Syntax Checks
"
autocmd FileType ruby nnoremap <silent><localleader>s :! ruby -cw %<CR>
autocmd FileType javascript nnoremap <silent><localleader>s :! jshint --verbose %<CR>

" auto-reload vim diff on buffer write
autocmd BufWritePost * if &diff == 1 | diffupdate | endif

" allow project-specific .vimrc
set exrc
set secure

" set tf syntax to python
au BufRead,BufNewFile *.tf set filetype=python

set tags=tags
