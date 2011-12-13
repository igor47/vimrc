call pathogen#infect()

set showcmd
set mouse=a
set tildeop

set hlsearch
set ic
set scs

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
