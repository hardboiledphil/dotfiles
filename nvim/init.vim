" hardboiledphil attempt at a Jess Archer style nvim init file
"
"

"--------------------------------------------------------------------------
" General
"--------------------------------------------------------------------------
syntax on

set expandtab
set shiftwidth=4
set tabstop=4
set hidden
set signcolumn=yes:2
set relativenumber
set number
set termguicolors
set undofile
set nospell
set title
set ignorecase
set smartcase
set wildmode=longest:full,full
set nowrap
set list
set listchars=tab:▸\ ,trail:·
set mouse=a
set scrolloff=8
set sidescrolloff=8
set nojoinspaces
set splitright
set clipboard=unnamedplus
set confirm
set exrc
set backup
set backupdir=~/.local/share/nvim/backup//
set updatetime=300 " Reduce time for highlighting other references
set redrawtime=10000 " Allow more time for loading syntax on large files
set showmode
set cursorline
set backspace=indent,eol,start
set linespace=0
set showmatch
set incsearch
set hlsearch
set foldenable

"--------------------------------------------------------------------------
" Vim UI
"--------------------------------------------------------------------------
if has('cmdline_info')
    set ruler                   " show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
        set showcmd                 " show partial commands in status line and
                                    " selected characters/lines in visual mode
    endif

    if has('statusline')
        set laststatus=2

        " Broken down into easily includeable segments
        set statusline=%<%f\    " Filename
        set statusline+=%w%h%m%r " Options
        set statusline+=%{fugitive#statusline()} "  Git Hotness
        set statusline+=\ [%{&ff}/%Y]            " filetype
        set statusline+=\ [%{getcwd()}]          " current dir
        set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
    endif

"--------------------------------------------------------------------------
" Key maps
"--------------------------------------------------------------------------

let mapleader = "\<space>"

nmap <leader>ve :edit ~/.config/nvim/init.vim<cr>
nmap <leader>vc :edit ~/.config/nvim/coc-settings.json<cr>
nmap <leader>vr :source ~/.config/nvim/init.vim<cr>

nmap <leader>k :nohlsearch<CR>
nmap <leader>Q :bufdo bdelete<cr>

nmap <leader>b :BufExplorer<CR>

" Disable the cursor keys to stop newbies from using them to often
cnoremap <Down> <Nop>
cnoremap <Left> <Nop>
cnoremap <Up> <Nop>
cnoremap <Right> <Nop>

inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>

nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>

vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>

" Switch the colons so quicker to quit
nnoremap ; :
nnoremap : ;

" Allow gf to open non-existent files
map gf :edit <cfile><cr>

" Quicker switching between windows
nmap <silent> <C-h> <C-w>h
nmap <silent> <C-j> <C-w>j
nmap <silent> <C-k> <C-w>k
nmap <silent> <C-l> <C-w>l

" Reselect visual selection after indenting
vnoremap < <gv
vnoremap > >gv

" Maintain the cursor position when yanking a visual selection
" http://ddrscott.github.io/blog/2016/yank-without-jank/
vnoremap y myy`y
vnoremap Y myY`y

" When text is wrapped, move by terminal rows, not lines, unless a count is provided
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Paste replace visual selection without copying it
vnoremap <leader>p "_dP

" Make Y behave like the other capitals
nnoremap Y y$

" Keep it centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Open the current file in the default program
nmap <leader>x :!xdg-open %<cr><cr>

" Quicky escape to normal mode
imap jj <esc>

" Easy insertion of a trailing ; or , from insert mode
imap ;; <Esc>A;<Esc>
imap ,, <Esc>A,<Esc>

cmap w!! %!sudo tee > /dev/null %

" Telescope config
" Find files using Telescope command-line sugar
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>




"--------------------------------------------------------------------------
" Plugins
"--------------------------------------------------------------------------

" Automatically install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(data_dir . '/plugins')

source ~/.config/nvim/plugins/gruvbox.vim
source ~/.config/nvim/plugins/airline.vim
source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/plugins/telescope.vim
source ~/.config/nvim/plugins/treesitter.vim
"source ~/.config/nvim/plugins/commentary.vim
"source ~/.config/nvim/plugins/context-commentstring.vim
"source ~/.config/nvim/plugins/dispatch.vim
"source ~/.config/nvim/plugins/dracula.vim
"source ~/.config/nvim/plugins/editorconfig.vim
"source ~/.config/nvim/plugins/eunuch.vim
"source ~/.config/nvim/plugins/exchange.vim
"source ~/.config/nvim/plugins/firenvim.vim
"source ~/.config/nvim/plugins/floaterm.vim
source ~/.config/nvim/plugins/fugitive.vim
"source ~/.config/nvim/plugins/fzf.vim
"source ~/.config/nvim/plugins/heritage.vim
"source ~/.config/nvim/plugins/lastplace.vim
"source ~/.config/nvim/plugins/lion.vim
"source ~/.config/nvim/plugins/markdown-preview.vim
"source ~/.config/nvim/plugins/nerdtree.vim
"source ~/.config/nvim/plugins/pasta.vim
"source ~/.config/nvim/plugins/peekaboo.vim
"source ~/.config/nvim/plugins/phpactor.vim
"source ~/.config/nvim/plugins/polyglot.vim
"source ~/.config/nvim/plugins/projectionist.vim
"source ~/.config/nvim/plugins/quickscope.vim
"source ~/.config/nvim/plugins/repeat.vim
"source ~/.config/nvim/plugins/rooter.vim
"source ~/.config/nvim/plugins/sayonara.vim
"source ~/.config/nvim/plugins/smooth-scroll.vim
"source ~/.config/nvim/plugins/splitjoin.vim
"source ~/.config/nvim/plugins/surround.vim
"source ~/.config/nvim/plugins/targets.vim
"source ~/.config/nvim/plugins/textobj-xmlattr.vim
"source ~/.config/nvim/plugins/unimpaired.vim
"source ~/.config/nvim/plugins/vim-test.vim
"source ~/.config/nvim/plugins/visual-multi.vim
"source ~/.config/nvim/plugins/visual-star-search.vim
"source ~/.config/nvim/plugins/which-key.vim

call plug#end()
doautocmd User PlugLoaded

"--------------------------------------------------------------------------
" Miscellaneous
"--------------------------------------------------------------------------
autocmd vimenter * ++nested colorscheme gruvbox
