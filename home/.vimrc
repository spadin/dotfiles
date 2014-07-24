set nocompatible

" setup vundle
source ~/.vimrc.d/setup_vundle.vim

" Set the colorscheme to solarized.
set background=dark
colorscheme solarized

" colors and indentation
filetype plugin indent on
syntax on

" general settings
set expandtab
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set ls=2
set modeline
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

" highlight extra whitespace and remove it on save
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction
autocmd BufWritePre     *.rb     :call TrimWhiteSpace()
autocmd BufWritePre     *.coffee :call TrimWhiteSpace()

" speclj lispwords
autocmd FileType clojure setlocal lispwords+=describe,it,context,around,should=,should-not=

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

" rspec shortcuts
" uses vim-rspec and tslime.vim
let g:rspec_command = 'call Send_to_Tmux("bundle exec rspec {spec}\n")'
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

let g:vim_markdown_folding_disabled=1
