call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'pangloss/vim-javascript'
Plug 'othree/yajs.vim'
Plug 'nikvdp/ejs-syntax'
Plug 'mxw/vim-jsx'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
" Plug 'vim-scripts/YankRing.vim'
call plug#end()

" Airline configs
let g:airline_theme='distinguished'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" Ctrl-p configs
let g:ctrlp_map = '<c-p>'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=*/node_modules/*

set ruler
set number relativenumber

set expandtab
set shiftwidth=4
set softtabstop=4
if has("autocmd")
  filetype indent plugin on
endif

syntax on
