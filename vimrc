"load pathogen, which will load all the other modules in bundle/
let g:pathogen_disabled = []
call add(g:pathogen_disabled, 'minibufexpl')
call pathogen#infect()

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

set title         " set windows title
set nohidden        " disallow hidden buffers
set winminheight=0 " enable 0-height windows
set scrolloff=3   " scroll before reaching the bottom
set visualbell    " visual bell
set showcmd       " show the command i'm about to use as i type it
set tildeop       " ~ behaves like an operator 
set shortmess+=filmnrxoOtT " shorten the interactive prompts a bit
set history=1000  " longer command history
set mouse=a

" automatically deal with files of different type
syntax on
filetype on
filetype indent on

" turn on indentation
set autoindent
set foldmethod=indent
set foldignore=

" my tab/whitespace settings: 3 spaces per tab
set tabstop=3
set shiftwidth=3
set expandtab

" the list
set list listchars=tab:>-,trail:-
set nolist

"switch ` and ' characters for moving to a save point
nnoremap ' `
nnoremap ` '

"remove trailing whitespace
autocmd FileType python,php autocmd BufWritePre <buffer> :%s/\s\+$//e

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

" Wrapped lines goes down/up to next row, rather than next line in file.
nnoremap j gj
nnoremap k gk
