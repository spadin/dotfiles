set nocompatible

" setup vundle
source ~/.vimrc.d/setup_vundle.vim

" Set the colorscheme to solarized.
set background=dark
colorscheme solarized

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

" remap shifted keys
command WQ wq
command Wq wq
command W w
command Q q
command Qa qa
command QA qa

" my keybindings
:inoremap jk <Esc>
:noremap <F2> :NERDTreeToggle<CR>
:nmap <leader>r :NERDTreeFind<CR>
:nnoremap <Esc><Esc> :nohl<CR>
:nnoremap <c-h> <c-w>h
:nnoremap <c-j> <c-w>j
:nnoremap <c-k> <c-w>k
:nnoremap <c-l> <c-w>l

" ctrl-p settings
let g:ctrlp_map = '<c-t>'
set wildignore+=build
