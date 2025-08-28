" --- Appearance ---

colorscheme habamax

set number relativenumber
set ruler " show columns
set showcmd
set mouse=a
set belloff=all

set list " enable showing listchars
set listchars=tab:>-,trail:~ " show trailing whitespace and tabs


" --- Search ---

set incsearch
set hlsearch
set ignorecase
set smartcase
nnoremap <esc> :noh<return><esc>
vnoremap // y/<C-R>"<CR>


" --- Coding ---

fun! SetTabSize(param)
  let &tabstop=a:param
  let &shiftwidth=a:param
  let &softtabstop=a:param
endfun

call SetTabSize(2)
set expandtab

set cino=N-s " don't indent namespaces

set wildmenu " suggestion popup
set wildmode=longest,list,full

" permanent undo
set undodir=~/.vimdid
set undofile

" copy to a system CLIPBOARD register (:help quoteplus)
noremap <leader>y "+y
noremap <leader>p "+p


" --- Explore ---
" Call ctags -R . to generate

nnoremap <A-]> <C-]>
nnoremap <A-[> :pop<CR>


" --- PLUGINS ---

call plug#begin()

" fzf
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

nnoremap <A-f> :Files<CR>
nnoremap <A-t> :Tags<CR>
nnoremap <A-b> :Buffers<CR>
nnoremap <A-r> :Rg 
vnoremap <A-r> y:Rg <C-R>"<CR>
vnoremap <A-R> y:Rg <C-R>"


" File Tree Viewer
Plug 'lambdalisue/vim-fern'
nnoremap <leader>t :Fern . -drawer -reveal=% -toggle<CR>

" Switch between .c/.h .cpp/.hpp
Plug 'vim-scripts/a.vim'
nnoremap <A-s> :A<CR>

call plug#end()
