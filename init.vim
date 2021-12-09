call plug#begin('~/.config/nvim/autoload/plugged')
    Plug 'joshdick/onedark.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'vim-airline/vim-airline'
    Plug 'preservim/nerdtree'
call plug#end()

colorscheme onedark
let g:airline_section_z = 'Ln %l Col %c'
let g:airline#extensions#branch#enabled = 1

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
set timeoutlen=500
set clipboard=unnamedplus

" Numbers
set number relativenumber
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

map <C-Q> :NERDTree<CR>>
