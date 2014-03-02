set nocompatible

" setup vundle
source ~/.vimrc.d/setup_vundle.vim

" colors and indentation
filetype plugin indent on
syntax enable

" general settings
set expandtab
set hlsearch
set ignorecase
set laststatus=2
set lazyredraw
set mouse=a
set nonumber
set noshowmode
set nowrap
set shiftwidth=2
set smartcase
set smartindent
set splitbelow
set splitright
set tabstop=2
set ttyfast
set ttymouse=xterm2

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
