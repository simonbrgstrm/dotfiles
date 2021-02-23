syntax enable

set expandtab
set smartindent
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set nowrap
set incsearch
set scrolloff=8

set number
set relativenumber
set linebreak
set showbreak=+++
set textwidth=100
set showmatch

set hlsearch
set smartcase
set ignorecase

set autoindent
set smarttab

set ruler

set undolevels=1000
set backspace=indent,eol,start

set cmdheight=1
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

call plug#begin('~/.vim/plugged')

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" Ansible yaml
Plug 'pearofducks/ansible-vim'

" Completion
Plug 'valloric/youcompleteme'

" Git Plugin
Plug 'tpope/vim-fugitive'

" Explorer tree
Plug 'scrooloose/nerdtree'

Plug 'gruvbox-community/gruvbox'

call plug#end()

colorscheme gruvbox

let mapleader = " "

" Explorer tree settings
filetype plugin indent on

" Tab nav
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" Shortcut nerdtree ctrl+n
map <C-n> :NERDTreeToggle<CR>
