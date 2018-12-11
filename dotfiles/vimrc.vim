set nocompatible

" Interface
set number
set ruler
hi Visual cterm=NONE ctermbg=White ctermfg=Black
highlight clear SignColumn

" Functionality
syntax on
set incsearch
set hlsearch
set showmatch
set smartcase
set backspace=indent,eol,start
set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class,.sass_cache,__pycache__,.DS_Store,.git
set wildignore+=*.o,*.so,*.rdb,*.aof,*.jar
set title

" :w! Will Force File to Save
cmap w!! w !sudo tee % >/dev/null

" Tabulation
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
set autoindent
autocmd FileType make setlocal noexpandtab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Smoother Commanding and Exit to Normal Mode
nnoremap ; :

" Map <esc> to clear search highlights on normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

" Toggle Paste Mode on <F2>
set pastetoggle=<F2>
