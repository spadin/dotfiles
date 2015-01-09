set nocompatible

" setup vundle
source ~/.vimrc.d/setup_vundle.vim

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
set noswapfile
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
autocmd FileType clojure setlocal lispwords+=describe,it,context,around

" set markdown ft
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" remap shifted keys
command WQ wq
command Wq wq
command W w
command Q q
command Qa qa
command QA qa

" my keybindings
:inoremap jk <Esc>
:inoremap jj <Esc>
:noremap <F2> :NERDTreeToggle<CR>
:nmap <leader>r :NERDTreeFind<CR>
:nnoremap <Esc><Esc> :nohl<CR>
:nnoremap <c-h> <c-w>h
:nnoremap <c-j> <c-w>j
:nnoremap <c-k> <c-w>k
:nnoremap <c-l> <c-w>l

" ctrl-p settings
let g:ctrlp_map = '<c-t>'
let g:ctrlp_user_command = 'ag %s -f -l --nocolor -g ""'
set wildignore+=build

" rspec shortcuts
" uses vim-rspec and tslime.vim
let g:rspec_command = 'call Send_to_Tmux("bundle exec rspec {spec}\n")'
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

let g:vim_markdown_folding_disabled=1

" silently run shell command
command! -nargs=1 Silent
\ | execute ':silent !'.<q-args>
\ | execute ':redraw!'

hi MatchParen cterm=bold ctermbg=none ctermfg=magenta
