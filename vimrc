"load pathogen, which will load all the other modules in bundle/
let g:pathogen_disabled = []
call add(g:pathogen_disabled, 'minibufexpl')
call pathogen#infect()

" my <leader> character for custom commands
let mapleader = ","
"set rulerformat=%<%{fugitive#statusline()}:%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

"always enable theruler
set ruler
set rulerformat=%40(%=%{fugitive#statusline()}\:b%n%m%r%w\ %4l,%-7(%c%V%)\ %P%)

" always disable laststatus
set laststatus=0
set statusline=%<%{fugitive#statusline()}:%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

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

" automatically deal with files of different type
syntax on
filetype on
filetype indent on

" turn on indentation
set autoindent
set foldmethod=indent

" reset folds with a single button (F5)
map <F5> <ESC>:set foldmethod=indent<CR>zmzrzv

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

" for supertab: make it context sensitive
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

" python settings
let python_highlight_all=1
let python_highlight_builtins=1
let g:pyflakes_use_quickfix = 0  " turn off quickfix window for pyflakes
let g:pep8_map='<leader>8'

" php settings
let php_folding = 0
let php_strict_blocks = 0

let processing_doc_path="/home/igor47/software/processing/modes/java/reference"

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
