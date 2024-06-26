"" auto install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-rooter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'digitaltoad/vim-pug'
Plug 'godlygeek/tabular'
Plug 'jpalardy/vim-slime'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'karolbelina/uxntal.vim'
Plug 'mattn/emmet-vim'
Plug 'mbbill/undotree'
Plug 'mxw/vim-jsx'
Plug 'ntpeters/vim-better-whitespace'
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vhda/verilog_systemverilog.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-syntastic/syntastic'
Plug 'vimwiki/vimwiki'
Plug 'zimbatm/haproxy.vim'
" Plug 'itchyny/lightline.vim'
" Plug 'vim-scripts/YankRing.vim'
call plug#end()

" Airline configs
let g:airline_theme='distinguished'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#buffer_nr_show = 1
set noshowmode
set bg=dark

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

" vim-rooter for nodejs projects
let g:rooter_patterns = ['node_modules']

set expandtab
set shiftwidth=4
set softtabstop=4
set background=dark
set t_Co=256

autocmd Filetype yaml setlocal shiftwidth=2 softtabstop=2
autocmd Filetype yml setlocal shiftwidth=2 softtabstop=2

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
au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.svelte set filetype=html

if has("autocmd")
  filetype indent plugin on
endif

" Persistent undo
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let undoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . undoDir)
    let &undodir = undoDir
    set undofile
endif

" better whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

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

map <leader>D :put =strftime('%Y-%m-%d')<CR>

" find and replace currently selected
" https://stackoverflow.com/questions/676600/vim-search-and-replace-selected-text
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Markdown settings
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_folding_disabled = 1

let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro rnu'

" Uses ripgrep in fzf
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" search for visually selected text http://vim.wikia.com/wiki/Search_for_visually_selected_text
vnoremap // y/<C-R>"<CR>
" * don't jump to next occurance https://stackoverflow.com/questions/4256697/vim-search-and-highlight-but-do-not-jump
nnoremap * :keepjumps normal! mi*`i<CR>

" move lines http://vim.wikia.com/wiki/Moving_lines_up_or_down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" fix netrw mt, mf, mc
let g:netrw_keepdir=0

" use together with autoread
au CursorHold,CursorHoldI * checktime

" finds git root from sub folders
function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

" jump to last edit position
augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

" syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_generic = 1
let g:syntastic_javascript_eslint_exec = '/bin/ls'
let g:syntastic_javascript_eslint_exe = 'npx slint'
let g:syntastic_javascript_eslint_args='-f compact'

let g:jsx_ext_required = 1

" make syntastic passive for html
" let g:syntastic_mode_map = { "mode": "active", "passive_filetypes": ["html"] }
let g:syntastic_mode_map = { "mode": "passive" }

command! ProjectFiles execute 'Files' s:find_git_root()

" enable these if the os is linux, uses wl-clipboard to provide the plus and
" star register

if $POYU_OS == "linux"
    xnoremap "+y y:call system("wl-copy", @")<cr>
    nnoremap "+p :let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<cr>p
    nnoremap "*p :let @"=substitute(system("wl-paste --no-newline --primary"), '<C-v><C-m>', '', 'g')<cr>p
endif
