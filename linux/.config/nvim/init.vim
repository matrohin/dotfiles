" --- general settings ---
set nocompatible
set backspace=indent,eol,start
set ruler
set number relativenumber
set showcmd
set mouse=a

" --- search ---
set incsearch
set hlsearch
set ic
nnoremap <esc> :noh<return><esc>
vnoremap // y/<C-R>"<CR>

" --- tabs->spaces ---
fun! SetTabSize(param)
  let &tabstop=a:param
  let &shiftwidth=a:param
  let &softtabstop=a:param
endfun

call SetTabSize(2)
set expandtab

" --- tabs ---
nnoremap <F3> :tabn<Enter>
nnoremap <F2> :tabp<Enter>
nnoremap <C-t> :tabe<Enter>

" --- custom colors ---
set t_Co=256
hi clear SignColumn
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

" --- trailing spaces ---
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" --- plugins ---
filetype off
call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_show_hidden = 1
let g:ctrlp_root_markers = ['.root']
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
nnoremap <leader>T :NERDTreeFind<Enter>
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-clang'
let g:deoplete#enable_at_startup = 1
let g:deoplete#max_list = 20
set completeopt-=preview

Plug 'ludovicchabant/vim-gutentags'
let g:gutentags_project_root = ['.root']

Plug 'vim-scripts/a.vim'

Plug 'rhysd/vim-clang-format'
nnoremap <leader>f :ClangFormat<Enter>
vnoremap <leader>f :ClangFormat<Enter>

Plug 'davidhalter/jedi-vim'

Plug 'kburdett/vim-nuuid'

Plug 'octol/vim-cpp-enhanced-highlight'
let g:cpp_member_variable_highlight = 1

call plug#end()

filetype plugin indent on
syntax on
