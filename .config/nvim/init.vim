" Plugin settings
call plug#begin('~/.config/nvim/autoload/plugged')
    Plug 'joshdick/onedark.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'vim-airline/vim-airline'
    Plug 'preservim/nerdtree'
    Plug 'neovim/nvim-lspconfig'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'mfussenegger/nvim-jdtls'
    Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
    Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
call plug#end()

" Start coq
let g:coq_settings = { 'auto_start': 'shut-up' }

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
set scrolloff=2

" Numbers
set number relativenumber

" File tree
map <C-T> :NERDTree<CR>>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if &filetype !=# 'gitcommit' | NERDTree | endif
autocmd VimEnter * if argc() > 0 || exists("s:std_in") | wincmd p | endif
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1

" Window / Buffer
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-l>    :vertical resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <C-H>    :bprevious<CR>
nnoremap <C-L>    :bnext<CR>
nnoremap <C-N>    :wincmd w<CR>

" Save / Close
nnoremap <C-Q>    :bp <BAR> bd #<CR>
nnoremap <C-S>    :w<CR>

" Fuzzy finder
nnoremap <C-P>    :call FinderCheck() <BAR> :Files <CR>
nnoremap <M-f>    :call FinderCheck() <BAR> :Lines <CR>

function FinderCheck()
    if bufname('#') =~ 'NERD_tree_\d\+' "&& bufname('%') !~ 'NERD_tree_\d\+'
        execute "normal! \<C-W>w"
    endif
endfunction

" Java commands
let java_path = "/usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java"
let javac_path = "/usr/lib/jvm/java-8-openjdk-amd64/bin/javac"

function JAVA_compileAll()
    execute "! find . -name *.java -print | xargs " . g:javac_path
    " echo "Compiled all .java files."
endfunction

function JAVA_compileFile()
    execute "!" . g:javac_path . " " . expand('%')
    " echo "Compiled current java file."
endfunction

function JAVA_cleanDir()
    execute "!rm *.class"
    " echo "Cleaned directory."
endfunction

function JAVA_run()
    execute "!" . g:java_path . " " . expand("%:r")
endfunction

command JavacA call JAVA_compileAll()
command JavacF call JAVA_compileFile()
command Ja JavacA
command Jf JavacF

command JavaClean call JAVA_cleanDir()

command JavaRCA call JAVA_compileAll() | call JAVA_run()
command JavaR call JAVA_run()
command Jr JavaR
command Jrc JavaRCA
