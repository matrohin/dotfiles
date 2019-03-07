set nocompatible

" --- General settings ---
set backspace=indent,eol,start
set ruler
set number
set showcmd

" Search
set incsearch
set hlsearch
set ic
nnoremap <esc> :noh<return><esc>
vnoremap // y/<C-R>"<CR>

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
let g:ctrlp_max_files = ''
let g:ctrlp_max_depth=40
let g:ctrlp_clear_cache_on_exit = 0
nnoremap <C-l> :CtrlPTag<CR>

Plug 'itchyny/lightline.vim'
set noshowmode
" Replace filename component of Lightline statusline
let g:lightline = {
  \ 'component_function': {
  \   'filename': 'FilenameForLightline'
  \ }
  \ }

" Show full path of filename
function! FilenameForLightline()
  return expand('%')
endfunction

Plug 'edkolev/tmuxline.vim'
let g:tmuxline_powerline_separators = 0

Plug 'KabbAmine/zeavim.vim'

Plug 'vim-scripts/The-NERD-tree'
nnoremap <leader>t :NERDTreeToggle<Enter>
nnoremap <leader>f :NERDTreeFind<Enter>
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1

Plug 'ludovicchabant/vim-gutentags'

call plug#end()

