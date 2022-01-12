" Plugin settings
call plug#begin('~/.config/nvim/autoload/plugged')
    Plug 'joshdick/onedark.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'vim-airline/vim-airline'
    Plug 'preservim/nerdtree'
call plug#end()

" Colorscheme and Airline settings
colorscheme onedark
let g:airline_section_z = 'Ln %l Col %c'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" Options
set nowrap
set ruler
set encoding=utf-8
set fileencoding=utf-8
set iskeyword+=-
set mouse=a
set splitbelow
set splitright
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent
set autoindent
set laststatus=0
set background=dark
set updatetime=300
set timeoutlen=1000
set clipboard=unnamedplus
set hidden

" Numbers
set number relativenumber

" File tree
map <C-T> :NERDTree<CR>>
autocmd VimEnter * NERDTree
autocmd VimEnter * if &filetype !=# 'gitcommit' | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Window / Buffer
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize +2<CR>
nnoremap <M-l>    :vertical resize -2<CR>
nnoremap <C-H>    :bprevious<CR>
nnoremap <C-L>    :bnext<CR>
nnoremap <C-Space>    :wincmd w<CR>

" Save / Close
nnoremap <C-Q>    :bp <BAR> bd #<CR>
nnoremap <C-S>    :w<CR>
