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

" ccls integration
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jackguo380/vim-lsp-cxx-highlight'

" CSV support
Plug 'mechatroner/rainbow_csv'

call plug#end()

" airline config
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" syntax highlighting
syntax on
set background=dark
colorscheme vividchalk
set clipboard=unnamed

set autoindent
set nosmartindent

" indenting rules
set shiftwidth=0
autocmd FileType ruby setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType java setlocal noexpandtab tabstop=4 softtabstop=4
autocmd FileType json setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType cpp setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType cmake setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType yaml setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType awk setlocal noexpandtab tabstop=4

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
let NERDTreeIgnore = ['\~$', '\.o$[[file]]']

" NERDTreeToggle leader mapping
" nnoremap <leader>f :NERDTreeToggle<CR>

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

""""""""""""""
" COC config
""""""""""""""

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf8

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
