filetype plugin indent on
syntax on

call plug#begin('~/.vim/plugged')


Plug 'morhetz/gruvbox' 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'itchyny/lightline.vim'
"Plug 'itchyny/vim-gitbranch'

call plug#end()

set number relativenumber

let mapleader=" "

set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=-4
set expandtab
set showmatch "show matching brackets

set incsearch
set ignorecase
set smartcase

set clipboard=unnamed

set laststatus=2
set ruler
set wildmenu

set showcmd

set encoding=utf-8

set directory^=$HOME/.vim/tmp//

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap ; :
nnoremap : ;

if !&scrolloff
	set scrolloff=1
endif
if !&sidescrolloff
	set sidescrolloff=5
endif
set display+=lastline

" Remove newbie crutches in Command Mode
cnoremap <Down> <Nop>
cnoremap <Left> <Nop>

cnoremap <Up> <Nop>

" Remove newbie crutches in Insert Mode
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>

" Remove newbie crutches in Normal Mode
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>

" Remove newbie crutches in Visual Mode
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>

let g:rainbow_active=1
let g:gruvbox_italic=1
"autocmd vimenter * ++nested

set background=dark
colorscheme gruvbox

" airline {
      if !exists('g:airline_symbols')
          let g:airline_symbols = {}
      endif
      let g:airline_symbols.space = "\ua0"
      let g:airline#extensions#tabline#enabled = 1
      "let g:airline#extensions#tabline#buffer_idx_mode = 1
      "nmap <leader>1 <Plug>AirlineSelectTab1
      "nmap <leader>2 <Plug>AirlineSelectTab2
      "nmap <leader>3 <Plug>AirlineSelectTab3
      "nmap <leader>4 <Plug>AirlineSelectTab4
      "nmap <leader>5 <Plug>AirlineSelectTab5
      "nmap <leader>6 <Plug>AirlineSelectTab6
      "nmap <leader>7 <Plug>AirlineSelectTab7
      "nmap <leader>8 <Plug>AirlineSelectTab8
      "nmap <leader>9 <Plug>AirlineSelectTab9
      "let g:airline#extensions#tabline#show_buffers = 1
  " }

  "let g:lightline = {
"      \ 'active': {
"      \   'left': [ [ 'mode', 'paste' ],
"      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
"      \ },
"      \ 'component_function': {
"      \   'gitbranch': 'gitbranch#name'
"      \ },
"      \ }
"autocmd VimEnter * NERDTree
"autocmd BufEnter * NERDTreeMirror

"CTRL-t to toggle tree view with CTRL-t
"nmap <silent> <C-t> :NERDTreeToggle<CR>
"Set F2 to put the cursor to the nerdtree

"nmap <silent> <F2> :NERDTreeFind<CR>

"let g:ycm_rust_src_path="/home/phillip/dev/gitrepo/rust/Developer/rust-master/src/"

Plug 'morhetz/gruvbox' 

"Plug 'nvim-lua/plenary.nvim'
"Plug 'nvim-telescope/telescope.nvim'
"Plug 'scrooloose/nerdtree'
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update


