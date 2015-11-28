set nocompatible              " be iMproved, required
filetype off                  " required
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

" VUNDLE
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/syntastic'
" Plugin 'L9'
" Fuzzy serach for filename
Plugin 'https://github.com/kien/ctrlp.vim'
" Golang plugin
Plugin 'fatih/vim-go'
" Search for a string
Plugin 'mileszs/ack.vim'
" File explorer
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
" Git plugin
Plugin 'tpope/vim-fugitive'
" Python autocomplete and docs
Plugin 'davidhalter/jedi-vim'
" Javascript autocomplet and docs
Plugin 'ternjs/tern_for_vim'
" Delimiters
Plugin 'Raimondi/delimitMate'
" Autocomplete
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


let mapleader = ","
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>wc :%s/\(.\+\)/'\1',<cr>
autocmd Filetype python let @a='import pytest; pytest.set_trace()'

"NERDTREE
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <leader><C-n> :NERDTreeToggle<CR>

" ACK
nmap <Leader><Leader> :Ack 

"CTRLP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/gradle/*,*/build/*,*/node_modules/*

let g:ctrlp_custom_ignore = {'dir':  '\v[\/](\.git|\.hg|\.svn|node_modules)$', 'file': '\v\.(exe|so|dll)$', 'link': 'some_bad_symbolic_links'}

"GOLANG
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)

imap jk <Esc>
