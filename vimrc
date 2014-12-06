
"     /)/)/) /).-')
"   ////((.'_.--'   .(\(\(\                   n/(/.')_         .
"  ((((_/ .'      .-`)))))))                  `-._ ('.'        \`(\
" (_._ ` (         `.   (/ |                      \ (           `-.\
"     `-. \          `-.  /                        `.`.           \ \
"        `.`.          | /                /)         \ \           | L
"          `.`._.      ||_               (()          `.\          ) F
"  (`._      `. <    .'.-'                \`-._____    ||        .' /
"   `(\`._.._(\(\)_.'.'-------------.___   `-.(`._ `-./ /     _.' .'
"     (.-.| \_`.__.-<     `.    . .-'   `-.   _> `-._((`.__.-'_.-'
"         (.--'   ' |    \ \     /| \.-./ |\ `-.   _.'>.___,-'`.
"            (  o  <      |     |  `o   o'  |  /(`'.-'   --.    \
"          .'     /      .'   _ |   |   |   |  ( .'/  o .-'   \  |
"          (__.-.`-._  -'    '   \  \   /  /    ' /    _/      | J
"                \_  `.      _.__.L |   | J      (  .'\`.    _/-./
"                  `-<  .-L|'`-|  ||\\V/ ||       `'   L \  /   /
"                     |J  ||    \ ||||  |||            |  |_|  )
"                     ||  ||     )||||  |||            || / ||J
"                     (|  (|    / |||)  (||            |||  |||
"                     ||  ||   / /||||  |||            |(|  |||
"                     ||  ||  / / ||||  |||            |||  |||
"______.------.______/ |_/ |_/_|_/// |__| \\__________// |--( \\---------
"                    '-' '-'       '-'    `-`          '-'    `-`

" GUI {{{
if has("gui_running")
  set guioptions -=rL
  set guioptions -=e
endif
"}}}
" Plugins {{{
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'ervandew/supertab'
Plug 'kien/ctrlp.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'sjl/badwolf'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rvm'
Plug 'tpope/vim-cucumber'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/fish-syntax'
Plug 'chreekat/vim-paren-crosshairs'
Plug 'zhaocai/GoldenView.Vim'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-reload'
Plug 'trapd00r/vimpoint'
Plug 'ntpeters/vim-better-whitespace'
Plug 'mattn/flappyvird-vim'
Plug 'koron/nyancat-vim'
Plug 'uguu-org/vim-matrix-screensaver'
Plug 'leafo/moonscript-vim'
Plug 'junegunn/vader.vim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'ekalinin/Dockerfile.vim'
Plug 'whatyouhide/vim-gotham'
Plug 'bling/vim-airline'

Plug 'FriedSock/smeargle'
Plug 'FriedSock/ctrlpsimilar'
call plug#end()

"}}}
" Folding {{{
set fdm=marker
nnoremap <Space> za
vnoremap <Space> za
"}}}
" Random settings {{{
set nocompatible
filetype off
syntax enable
set number
set ruler
set encoding=utf-8
set backspace=indent,eol,start
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set sts=2
set list
set listchars=""
set listchars=tab:▸\ ,eol:¬
set listchars+=extends:>
set listchars+=precedes:<
set hlsearch
set incsearch
set ignorecase
set smartcase
set wildmenu
set wildmode=list:longest,full
set backupdir=~/.vim_backup,/tmp
set directory=~/.vim_temp,/tmp
set shell=/bin/bash
set timeoutlen=200
set showcmd
set scrolloff=3
set laststatus=2
set iskeyword-=_
set statusline=%f\ [%{strlen(&fenc)?&fenc:'none'},%{&ff}]%y%h%m%r%=%c,%l/%L\ %P

set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/plugins/*,*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*,*/tmp/*
set wildignore+=*/.git/*,*/.rbx/*,*/.hg/*,*/.svn/*,*/.DS_Store
set wildignore+=*.swp,*~,._*

au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,Procfile,*.ru,*.rake,*.rabl} set ft=ruby
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} set ft=markdown | call s:setupWrapping()
au BufRead,BufNewFile *.json set ft=javascript
au BufRead,BufNewFile *.scss set filetype=scss
au BufRead,BufNewFile *.vimrc.vpe set ft=vim

filetype on
filetype indent on
filetype plugin on

function! s:setupWrapping()
  set wrap
  set linebreak
  set textwidth=72
  set nolist
endfunction

" Remember last location in a file, unless it's a git commit message
au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
  \| exe "normal! g`\"" | endif

autocmd VimResized * wincmd =
"}}}
" Mappings {{{
let mapleader=","

command! W :w
command! Wq :wq
command! Q :q
noremap <cr> :nohlsearch<cr>

" Move around splits with Ctrl + HJKL
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-h> <c-w>h
noremap <c-l> <c-w>l

noremap K k
noremap J j
nnoremap  ;  :

" visual line mode is better than visual mode
noremap v V
noremap V v

" Open vimrc more easily
map <leader>v :edit $MYVIMRC<cr>
inoremap jk <esc>


vmap <Up> [egv
vmap <Down> ]egv

map <leader>p :! pdflatex %<cr><cr>
map <leader>g :! gnuplot %<cr><cr>
map <leader>r :! ruby %<cr><cr>

map <leader>N :NERDTreeToggle<cr>

"}}}
" Abbreviations {{{
" I can't spell or type
abbreviate recieve receive
abbreviate colleciton collection
abbreviate chloropleth choropleth
abbreviate pry require 'pry'; binding.pry
abbreviate dbg require 'debugger'; debugger
"}}}
" Search {{{
" This rewires n and N to do the highlighing...
nnoremap <silent> n   n:call HLNext(0.2)<cr>
nnoremap <silent> N   N:call HLNext(0.2)<cr>

" OR ELSE just highlight the match in blue...
function! HLNext (blinktime)
  let [bufnum, lnum, col, off] = getpos('.')
  let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
  let target_pat = '\c\%#'.@/
  let ring = matchadd('StatusLine', target_pat, 101)
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 300) . 'm'
  call matchdelete(ring)
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 300) . 'm'
  let ring = matchadd('StatusLine', target_pat, 101)
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 300) . 'm'
  call matchdelete(ring)
  redraw
endfunction
"}}}
" Colour Scheme {{{
set t_Co=256
colorscheme gotham
"}}}
" Smeargle {{{
let g:smeargle_colour_timeout = 1
let g:smeargle_colouring_scheme = ''
let g:smeargle_newline_term_colour = 22
let g:smeargle_newline_gui_colour = '#110011'
"}}}
" CtrlP {{{
let g:ctrlp_match_window_reversed = 0         " List files from top to bottom in CtrlP
let g:ctrlp_max_height = 30                   " Set the maximum height of the match window:
let g:ctrlp_working_path_mode = 0             " CtrlP shouldn't manage the current directory
nnoremap <leader>s :CtrlPSimilar<cr>
"}}}
" Strip Trailing Whitespace {{{
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
"}}}
" Number Toggle {{{
function! NumberToggle()
  if(&relativenumber == 1)
    set number
    set norelativenumber
  else
    set relativenumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>
"}}}
" Copy & Paste {{{
"Copy and pasting into terminal
if &term =~ "xterm.*"
    let &t_ti = &t_ti . "\e[?2004h"
    let &t_te = "\e[?2004l" . &t_te
    function! XTermPasteBegin(ret)
        set pastetoggle=<Esc>[201~
        set paste
        return a:ret
    endfunction
    map <expr> <Esc>[200~ XTermPasteBegin("i")
    imap <expr> <Esc>[200~ XTermPasteBegin("")
    cmap <Esc>[200~ <nop>
    cmap <Esc>[201~ <nop>
endif
"}}}
