"load pathogen, which will load all the other modules in bundle/
call pathogen#infect()

"switch ` and ' characters for moving to a save point
nnoremap ' `
nnoremap ` '

" my <leader> character for custom commands
let mapleader = ","

set wildmenu      " change behavior of file tab completion 
set wildmode=list:longest

set ignorecase    " smart case searching
set smartcase
set hlsearch      " highlight as we search

set title         " set windows title
set hidden        "allows better buffer management
set scrolloff=3   " scroll before reaching the bottom
set visualbell    " visual bell
set showcmd       " show the command i'm about to use as i type it
set tildeop       " ~ behaves like an operator 
set shortmess=atI " shorten the interactive prompts a bit
set history=1000  " longer command history

set mouse=a

syntax on
let python_highlight_all=1
let python_highlight_builtins=1

let php_folding = 0
let php_strict_blocks = 0

let processing_doc_path="/home/igor47/software/processing/modes/java/reference"

set list listchars=tab:>-,trail:-
set nolist

set autoindent
filetype indent on

set tabstop=3
set shiftwidth=3
set expandtab

set foldmethod=indent
" reset folds with a single button (F5)
map <F5> <ESC>:set foldmethod=indent<CR>zmzrzv

" autocomplete funcs and identifiers for languages
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

"arduino
autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino
