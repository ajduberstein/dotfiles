set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin indent on    " required


call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'crusoexia/vim-monokai'
Plug 'fatih/vim-go'
Plug 'pangloss/vim-javascript'
Plug 'mileszs/ack.vim'
Plug 'junegunn/vim-easy-align'
Plug 'nsf/gocode'
Plug 'Raimondi/delimitMate'
Plug 'nvie/vim-flake8'
Plug 'davidhalter/jedi-vim'
call plug#end()


syntax on
" Hide vim temp files
set backupdir=~/vimtmp,.
set directory=~/vimtmp,.
set number
set paste
set hlsearch
set showmatch
set incsearch
set ignorecase
set nowrap
set autoindent
set backspace=indent,eol,start
set history=1000
set cursorline
if has("unnamedplus")
  set clipboard=unnamedplus
elseif has("clipboard")
  set clipboard=unnamed
endif

" MONOKAI
syntax enable
colorscheme monokai

"TAB SPACING
autocmd Filetype python setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype go setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype sh setlocal ts=2 sts=2 sw=2 expandtab

set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)


let mapleader = ","
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>wc :%s/\(.\+\)/'\1',<cr>
autocmd Filetype python let @a='import pytest; pytest.set_trace()'

"NERDTREE
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-e> :NERDTreeToggle<CR>
map <leader><C-f> :NERDTreeFind<cr>


" ACK
nmap <Leader><Leader> :Ack 

"CTRLP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/gradle/*,*/build/*,*/node_modules/*

let g:ctrlp_custom_ignore = {'dir':  '\v[\/](\.git|\.hg|\.svn|node_modules)$', 'file': '\v\.(exe|so|dll|pyc)$', 'link': 'some_bad_symbolic_links'}

"GOLANG
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)

let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:ycm_min_num_of_chars_for_completion = 1

set guioptions-=r 
set guioptions-=L

autocmd BufWritePost *.py call Flake8()

inoremap jk <Esc>
imap jk <Esc>
let g:syntastic_javascript_checkers = ['eslint']
let g:pymode_lint_config = '$HOME/pylint.rc'
let g:pymode_lint_ignore = "E501"
set autowrite

autocmd FileType python nnoremap <LocalLeader>= :0,$!yapf<CR>

let g:ackprg = 'ag --nogroup --nocolor --column'
