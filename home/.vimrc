set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'git://git.wincent.com/command-t.git'

syntax enable
filetype plugin indent on

set laststatus=2
set noshowmode
set nowrap
set nonumber
set hlsearch
set ignorecase
set smartcase
set splitright
set splitbelow
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set ttyfast
set mouse=a
set ttymouse=xterm2
set lazyredraw

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
