set title
set number
syntax on
hi Visual cterm=NONE ctermbg=White ctermfg=Black
highlight clear SignColumn

set showmatch
set smartcase
set wildignore=*.swp,*.bak,*.pyc,*.class,.sass_cache,__pycache__,.DS_Store,.git
set wildignore+=*.o,*.so,*.rdb,*.aof,*.jar

" TABULATION
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
autocmd FileType make setlocal noexpandtab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

nnoremap ; :

" AUTO-PASTEMODE
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
    set pastetoggle=<Esc>[201~
    set paste
    return ""
endfunction

call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'guns/vim-sexp', { 'for': ['clojure', 'racket', 'scheme'] }
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': ['clojure', 'racket', 'scheme'] }
call plug#end()

