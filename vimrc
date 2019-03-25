" load plug.vim
" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

" add our plugins
" python-related
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'vim-python/python-syntax'
Plug 'fs111/pydoc.vim'
Plug 'mitechie/pyflakes-pathogen'

" for javascript/typescript/react
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'

" for templating/editing HTML
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'ap/vim-css-color'
Plug 'mustache/vim-mustache-handlebars'

" unsorted
Plug 'tpope/vim-fugitive'
Plug 'msanders/snipmate.vim'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/pep8'
Plug 'ervandew/supertab'
Plug 'tpope/vim-git'
Plug 'spf13/PIV'
Plug 'c9s/gsession.vim'
Plug 'vim-scripts/gnupg.vim'
Plug 'MarcWeber/vim-addon-local-vimrc'
Plug 'tpope/vim-markdown'
Plug 'vim-scripts/Align'
Plug 'vim-scripts/IndentAnything'
Plug 'terryma/vim-multiple-cursors'
Plug 'kien/ctrlp.vim'
Plug 'GutenYe/json5.vim'

" allows matching begin/end blocks and symbols
Plug 'andymass/vim-matchup'

" done with plugins
call plug#end()

" use leo as default colorscheme
colorscheme leo

" my <leader> character for custom commands
let mapleader = ","
"set rulerformat=%<%{fugitive#statusline()}:%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

"always enable theruler
set laststatus=0  " always disable laststatus
set ruler
set rulerformat=%36(%=%{fugitive#statusline()}\:b%n%m%r%w\ %4l,%-7(%c%V%)\ %P%)
let MP_rulerwidth=36   "the matchparen plugin needs to know the width of the ruler

set wildmenu      " change behavior of file tab completion 
set wildmode=list:longest

set ignorecase    " smart case searching
set smartcase
set hlsearch      " highlight as we search

set backspace=indent,eol,start " allow backspacing over previous text

set title         " set windows title
set nohidden        " disallow hidden buffers
set winminheight=0 " enable 0-height windows
set scrolloff=3   " scroll before reaching the bottom
set visualbell    " visual bell
set showcmd       " show the command i'm about to use as i type it
set tildeop       " ~ behaves like an operator 
set shortmess+=filmnrxoOtT " shorten the interactive prompts a bit
set history=1000  " longer command history
set mouse=
set tabpagemax=50 " 50 tabs max instead of the default 10


" automatically deal with files of different type
syntax on
filetype on
filetype indent on

" turn on indentation
set autoindent
set foldmethod=indent
set foldignore=

" my tab/whitespace settings: 2 spaces per tab
set tabstop=2
set shiftwidth=2
set expandtab
" some installs of vim come with ftplugins that force their own settings >:-|
let g:python_recommended_style=0

" settings for ctrl-p
let g:ctrlp_lazy_update = 100 " refresh at max 10Hz 

" accept opens in a new tab
let g:ctrlp_prompt_mappings = {
         \ 'AcceptSelection("e")': ['<c-e>'],
         \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
         \ }

" listing commands for VCS with fallback
let g:ctrlp_user_command = {
      \ 'types': {
         \ 1: ['.git', 'cd %s && git ls-files'],
         \ 2: ['.hg', 'hg --cwd %s locate -I .'],
      \ },
      \ 'fallback': 'find %s -type f | egrep -iv "(\.(eot|gif|gz|ico|jpg|jpeg|otf|png|psd|pyc|svg|ttf|woff|zip)$)"'
   \ }

" the list
set list listchars=tab:>-,trail:-
set nolist

"switch ` and ' characters for moving to a save point
nnoremap ' `
nnoremap ` '

"don't expand tabs for makefiles
autocmd FileType make set noexpandtab

"remove trailing whitespace
autocmd FileType python,php,ruby,javascript,javascript.jsx autocmd BufWritePre <buffer> :%s/\s\+$//e

" python settings
let python_highlight_all=1
let python_highlight_builtins=1
let g:pyflakes_use_quickfix = 0  " turn off quickfix window for pyflakes
let g:pep8_map='<leader>8'
autocmd FileType python set omnifunc=pythoncomplete#Complete

" php settings
let php_folding = 0
let php_strict_blocks = 0
let php_htmlInStrings = 1
let php_baselib = 1
let php_sql_query = 1

" php-specific stuff
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType php set makeprg=php\ -l\ %
autocmd FileType php set errorformat=%m\ in\ %f\ on\ line\ %l
autocmd FileType php let g:DisableAutoPHPFolding = 1

" autocomplete funcs and identifiers for languages
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType c set omnifunc=ccomplete#Complete

"arduino
autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino

" processing
let processing_doc_path="/home/igor47/software/processing/modes/java/reference"

" random syntax settings
augroup filetypedetect
   au BufNewFile,BufRead *.pig set filetype=pig syntax=pig
   au BufNewFile,BufRead *.gradle set filetype=groovy syntax=groovy
augroup END

" for supertab: make it context sensitive
let g:SuperTabDefaultCompletionType = "context"
if exists("g:omnifunc")
   let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
endif

set completeopt=menuone,longest,preview                  " show a menu, select the longest match, and show preview window 
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif " close preview when the cursor moves
autocmd InsertLeave * if pumvisible() == 0|pclose|endif  " close preview when leaving insert


" help work with folds
nmap <leader>f0 :set foldlevel=0<CR>
nmap <leader>f1 :set foldlevel=1<CR>
nmap <leader>f2 :set foldlevel=2<CR>
nmap <leader>f3 :set foldlevel=3<CR>
nmap <leader>f4 :set foldlevel=4<CR>
nmap <leader>f5 :set foldlevel=5<CR>
nmap <leader>f6 :set foldlevel=6<CR>
nmap <leader>f7 :set foldlevel=7<CR>
nmap <leader>f8 :set foldlevel=8<CR>
nmap <leader>f9 :set foldlevel=9<CR>

" reset folds with a single button (F5)
map <F5> <ESC>:set foldmethod=indent<CR>zmzrzv

" clear highlighted search
nmap <silent> <leader>/ :nohlsearch<CR>
" echo current filename
nmap <leader>n :echo @%<CR>
" search and replace word under cursor
nmap <leader>s :%s/\<<C-r><C-w>\>/

" Wrapped lines goes down/up to next row, rather than next line in file.
nnoremap j gj
nnoremap k gk
