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
set ignorecase
set smartcase
nnoremap <esc> :noh<return><esc>
vnoremap // y/<C-R>"<CR>

" --- tabs->spaces ---
fun! SetTabSize(param)
  let &tabstop=a:param
  let &shiftwidth=a:param
  let &softtabstop=a:param
endfun

call SetTabSize(4)
set expandtab

" --- tabs ---
nnoremap <F3> :tabn<Enter>
nnoremap <F2> :tabp<Enter>
nnoremap <C-t> :tabe<Enter>

" --- do not indent namespaces ---
set cino=N-s

" --- custom colors ---
set t_Co=256
hi clear SignColumn
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

" --- trailing spaces ---
set listchars=tab:>-,trail:~,extends:>,precedes:<
set list

" --- :make settings ---
fun! EnableMsBuild(sln)
  let &errorformat='%f(%l%.%#): %t%.%# %.%n: %m'
  let &makeprg='msbuild.sh ' . a:sln
endfun

nnoremap <leader>e :copen<CR>
nnoremap <leader>E :cclose<CR>
nnoremap <F7> :Neomake!<CR>

" --- doxygen ---
nnoremap <leader>d ggO/// @file <Esc>:put=expand('%:t')<CR>kJo/ 

" --- tags ---
nnoremap <A-[> :pop<CR>
nnoremap <A-]> <C-]>

" --- copy bindings ---
noremap <leader>y "+y
noremap <leader>p "+p

" --- permanent undo ---
set undodir=~/.vimdid
set undofile

" --- complete by Ctrl-E shortcut
inoremap <C-e> <C-n>
" --- number of items in completion window
set pumheight=20

" --- russian keymap ---
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" --- save/quit shortcuts
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" --- plugins ---
filetype off
call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
set noshowmode
" Replace filename component of Lightline statusline
let g:lightline = {
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component_function': {
  \   'filename': 'FilenameForLightline'
  \ }
  \ }

fun! FilenameForLightline()
  return expand('%')
endfun

Plug 'edkolev/tmuxline.vim'
let g:tmuxline_powerline_separators = 0

Plug 'vim-scripts/The-NERD-tree'
nnoremap <leader>t :NERDTreeToggle<Enter>
nnoremap <leader>T :NERDTreeFind<Enter>
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1

Plug 'ludovicchabant/vim-gutentags'
let g:gutentags_project_root = ['.root']

Plug 'vim-scripts/a.vim'

Plug 'rhysd/vim-clang-format'
nnoremap <leader>f :ClangFormat<Enter>
vnoremap <leader>f :ClangFormat<Enter>
nnoremap <leader>F :ClangFormatAutoToggle<Enter>

Plug 'kburdett/vim-nuuid'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

nnoremap <A-f> :Files<CR>
nnoremap <A-t> :Tags<CR>
nnoremap <A-b> :Buffers<CR>
nnoremap <A-r> :Rg 
vnoremap <A-r> y:Rg "<C-R>""<CR>
vnoremap <A-R> y:Rg <C-R>"

" --- preview fzf commands Files and Rg ---
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.<q-args>, 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)


" --- cpp ---
Plug 'deoplete-plugins/deoplete-clang'
Plug 'octol/vim-cpp-enhanced-highlight'
let g:cpp_member_variable_highlight = 1

" --- LSP ---
Plug 'autozimu/LanguageClient-neovim', {
  \ 'branch': 'next',
  \ 'do': 'bash install.sh',
  \ }

set hidden

let g:LanguageClient_serverCommands = {
  \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
  \ }

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F5> :call LanguageClient#textDocument_rename()<CR>
let g:LanguageClient_diagnosticsEnable = 0

Plug 'rust-lang/rust.vim'
let g:rustfmt_autosave = 1

" Python

Plug 'deoplete-plugins/deoplete-jedi'

" Black(Python) format the visual selection: https://github.com/psf/black/issues/1352
xnoremap <Leader>k :!black --skip-string-normalization -l 120 -q -<CR>

call plug#end()

filetype plugin indent on
syntax on
