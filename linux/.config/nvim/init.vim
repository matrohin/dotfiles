set nocompatible

" --- General settings ---
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch

" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>

syntax on

set mouse=a

hi clear SignColumn

" --- tabs->spaces ---
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

filetype off                   " required

" --- tabs ---
nnoremap <F3> :tabn<Enter>
nnoremap <F2> :tabp<Enter>
nnoremap <C-t> :tabe<Enter>

call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_show_hidden = 1

Plug 'itchyny/lightline.vim'

Plug 'edkolev/tmuxline.vim'
let g:tmuxline_powerline_separators = 0

Plug 'KabbAmine/zeavim.vim'

Plug 'vim-scripts/The-NERD-tree'
nnoremap <leader>t :NERDTreeToggle<Enter>
nnoremap <leader>f :NERDTreeFind<Enter>
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

call plug#end()

