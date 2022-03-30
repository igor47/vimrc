" just in case
set nocompatible

" load plug.vim
" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

" add our plugins
" vim functionality features
Plug 'tpope/vim-surround'
Plug 'c9s/gsession.vim'

" super tab completion
Plug 'ervandew/supertab'

" editing pgp-encrypted files
Plug 'vim-scripts/gnupg.vim'

" sources local vimrc files
Plug 'embear/vim-localvimrc'

" fzf to quickly open local files
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" git related
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'

" language-independent syntax checking
Plug 'dense-analysis/ale'

" language-independent syntax highlighting
Plug 'sheerun/vim-polyglot'

" php
Plug 'spf13/PIV'

" python-related
Plug 'ambv/black', { 'on': 'Black' }
Plug 'davidhalter/jedi-vim'

" for templating/editing HTML
Plug 'ap/vim-css-color'

" allows matching begin/end blocks and symbols
Plug 'andymass/vim-matchup'

" vim wiki
Plug 'vimwiki/vimwiki'

" look up addresses with notmuch
Plug 'Konfekt/vim-notmuch-addrlookup'

" done with plugins
call plug#end()

" use leo as default colorscheme
colorscheme leo
" transparent background to better indicate tmux inactive panes
hi Normal guibg=NONE ctermbg=NONE

" make local vimrc remember my answers (if answered in uppercase)
let g:localvimrc_persistent=1
" local vimrc file name can also be '.vimrc.local'
let g:localvimrc_name=[".lvimrc", ".vimrc.local"]

" my <leader> character for custom commands
let mapleader = ","

"always enable theruler
set laststatus=0  " always disable laststatus
set ruler
set rulerformat=%36(%=%{fugitive#statusline()}\:b%n%m%r%w\ %4l,%-7(%c%V%)\ %P%)
"set rulerformat=%<%{fugitive#statusline()}:%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
let MP_rulerwidth=36   "the matchparen plugin needs to know the width of the ruler

set wildmenu      " change behavior of file tab completion
set wildmode=list:longest

" searching
set ignorecase    " smart case searching
set smartcase
set hlsearch      " highlight as we search
nmap <silent> <nowait> <leader>/ :nohlsearch<CR> " clear highlighted search

set backspace=indent,eol,start " allow backspacing over previous text
set nojoinspaces  " only one space after '.'

set title         " set windows title
set winminheight=0 " enable 0-height windows
set scrolloff=3   " scroll before reaching the bottom
set visualbell    " visual bell
set showcmd       " show the command i'm about to use as i type it
set tildeop       " ~ behaves like an operator
set shortmess+=filmnrxoOtT " shorten the interactive prompts a bit
set history=1000  " longer command history
set mouse=

" tabs and buffers
set tabpagemax=50 " 50 tabs max instead of the default 10
set hidden        " allow hidden buffers

" default to system clipboard
set clipboard=unnamedplus


" automatically deal with files of different type
syntax on
filetype on
filetype indent on

" turn on indentation
set autoindent
set foldmethod=indent
set foldignore=

" my tab/whitespace settings: 4 spaces per tab (to comply with black)
set tabstop=4
set shiftwidth=4
set expandtab
" some installs of vim come with ftplugins that force their own settings >:-|
let g:python_recommended_style=0

" use fzf to quickly open files
" for more commands, see: https://github.com/junegunn/fzf.vim#commands
"
" map to ctrl-p (used in git repos)
nnoremap <C-p> :GFiles<CR>
" map to ctrl-P (capital-P, any files in dir/subdir)
nmap <leader>p :Files<CR>
" browse open buffers
nmap <leader>b :Buffers<cr>

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

" settings for ale (syntax, etc.)
let g:ale_lint_on_text_changed = 'never'  " only lint when we save, not as we type
nmap <silent> <leader>aj :ALENext<cr>
nmap <silent> <leader>ak :ALEPrevious<cr>
nmap <silent> <leader>ag :ALEGoToDefinition<cr>
nmap <silent> <leader>ad :ALEDetail<cr>
nmap <silent> <leader>al :ALELint<cr>
nmap <silent> <leader>ak :ALEDocumentation<cr>
nmap <silent> <leader>ar :ALERename<cr>
nmap <silent> <leader>ac :ALEComplete<cr>

" python settings
let python_highlight_all=1
let python_highlight_builtins=1
let g:ale_python_pylint_options = '--errors-only --disable=E0402 --enable=W0611'

" jedi overrides some more generic ALE settings
let g:jedi#goto_command = ""
let g:jedi#goto_assignments_command = "<leader>ag"
let g:jedi#goto_stubs_command = ""
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "<leader>ak"
let g:jedi#usages_command = "<leader>au"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>ar"

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

" vimwiki settings
let g:markdown_enable_mappings = 0  " avoids conflicts with vimwki and markdown highlighting
let g:vimwiki_list = [{
      \ 'path': '~/documents/vimwiki/',
      \ 'syntax': 'markdown',
      \ 'ext': '.md',
      \ }]

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

" echo current filename
nmap <leader>n :echo @%<CR>
" search and replace word under cursor
nmap <leader>s :%s/\<<C-r><C-w>\>/

" Wrapped lines goes down/up to next row, rather than next line in file.
nnoremap j gj
nnoremap k gk

" maybe help with touchbar horribleness
:imap jk <Esc>

" helps with my split-key keyboard where Esc is pretty far
map <F1> <Esc>
imap <F1> <Esc>
