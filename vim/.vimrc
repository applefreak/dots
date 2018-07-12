call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'pangloss/vim-javascript'
Plug 'nikvdp/ejs-syntax'
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

syntax on
set ruler
set number relativenumber
set expandtab
set shiftwidth=4
set softtabstop=4
set autoread

if has("autocmd")
  filetype indent plugin on
endif

" Custom Commands
command FormatJson %!python -m json.tool

" keybindings

" Makes j & k to also move on wrapped lines, but still retains function when
" using motions
" https://blog.petrzemek.net/2016/04/06/things-about-vim-i-wish-i-knew-earlier/
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
