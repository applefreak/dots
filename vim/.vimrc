call plug#begin('~/.vim/plugged')
Plug '/usr/local/opt/fzf'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'mattn/emmet-vim'
Plug 'mbbill/undotree'
Plug 'pangloss/vim-javascript'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimwiki/vimwiki'
Plug 'jpalardy/vim-slime'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
" Plug 'itchyny/lightline.vim'
" Plug 'vim-scripts/YankRing.vim'
call plug#end()

" Airline configs
let g:airline_theme='distinguished'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
set noshowmode

let g:slime_target = "tmux"

" Lightline configs
" set laststatus=2
" let g:lightline = {
"             \ 'colorscheme': 'wombat'
"             \ }

" Ctrl-p configs
let g:ctrlp_map = '<c-p>'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=*/node_modules/*,*/min/*,*.min.*

set expandtab
set shiftwidth=4
set softtabstop=4

syntax on
set ruler
set number relativenumber
set autoread
set hlsearch
set ignorecase
set smartcase

" Make backspace behave normally
set backspace=indent,eol,start
set redrawtime=10000

" sets ejs as html
" au BufNewFile,BufRead *.ejs set filetype=html

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

" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" <C-j> & <C-k> to move up and down the complete popup list
inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <C-j>      pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <C-k>      pumvisible() ? "\<C-p>" : "\<Up>"

" rebinds vimwiki toggle list
nnoremap <leader>t :VimwikiToggleListItem<CR>
" let g:vimwiki_list = [{'syntax': 'markdown', 'ext': '.md'}]

" Markdown settings
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_folding_disabled = 1

let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro rnu'
