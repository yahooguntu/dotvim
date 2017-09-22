set nocompatible

set ttimeoutlen=50

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
set title

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

" use space as leader
nnoremap <SPACE> <Nop>
map <SPACE> <leader>

" map key to unhighlight all results
nnoremap <leader>n :nohlsearch<CR>

" linux xterm color support
if $TERM == 'xterm'
  set t_Co=256
endif

" nerdtree configs
let NERDTreeIgnore = ['\.wixobj$', '\.pyc$']

" NERDTreeToggle leader mapping
nnoremap <leader>f :NERDTreeToggle<CR>

" close vim if last tab is nerdtree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" start with nerdtree open
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"let g:nerdtree_tabs_open_on_console_startup=1


" alias bbye to \q
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
inoremap <c-@> <c-x><c-o>

" map :er to autofill :e with the current path prefix
cnoremap ,e e <c-r>=expand("%:h")<cr>/

" use 'Q' to apply the macro 'q'
nnoremap Q @q
vnoremap Q :norm @q<cr>

" toggle between absolute and relative line numbers
function! NumberToggle()
  if (&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

nnoremap <silent><leader>N :call NumberToggle()<cr>

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

" ag shortcut for next/prev
nnoremap <C-n> :cn<CR>
nnoremap <C-p> :cp<CR>

" next/prev buffer
nnoremap <silent><leader>[ :bp<CR>
nnoremap <silent><leader>] :bn<CR>

" enable vim-airline buffer bar
let g:airline#extensions#tabline#enabled = 1

" ruby syntax check
autocmd FileType ruby nnoremap <silent><localleader>s :! ruby -cw %<CR>
" js syntax check
autocmd FileType javascript nnoremap <silent><localleader>s :! jshint --verbose %<CR>
" auto-reload vim diff on buffer write
autocmd BufWritePost * if &diff == 1 | diffupdate | endif

" allow project-specific .vimrc
set exrc
set secure
