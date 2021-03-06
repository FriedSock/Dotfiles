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

let &fillchars="diff:\u0340"

" GUI {{{1
if has("gui_running")
  set guioptions -=rL
  set guioptions -=e
endif
" Plugins {{{1
if has('nvim')
  call plug#begin('~/.nvim/plugged')
else
  call plug#begin('~/.vim/plugged')
endif


Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'ervandew/supertab'
Plug 'kien/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'

Plug 'altercation/vim-colors-solarized'
Plug 'sjl/badwolf'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rvm'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/fish-syntax'
Plug 'chreekat/vim-paren-crosshairs'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-reload'
Plug 'vim-scripts/VimClojure'
Plug 'trapd00r/vimpoint'
"Plug 'ntpeters/vim-better-whitespace'
Plug 'mattn/flappyvird-vim'
Plug 'koron/nyancat-vim'
Plug 'uguu-org/vim-matrix-screensaver'
Plug 'leafo/moonscript-vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vader.vim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'ekalinin/Dockerfile.vim'
Plug 'whatyouhide/vim-gotham'
Plug 'bling/vim-airline'
Plug 'jszakmeister/vim-togglecursor'
Plug 'guns/vim-clojure-static'
Plug 'freeo/vim-kalisi'
Plug 'kchmck/vim-coffee-script'
Plug 'lepture/vim-velocity'
Plug 'elixir-lang/vim-elixir'

if has('nvim')
  Plug 'alexgenco/neovim-ruby'
end

call plug#end()



" Folding {{{1
set foldmethod=marker
nnoremap <Space> za
vnoremap <Space> za
" Random settings {{{1
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
set listchars=tab:▸\
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
set shell=/bin/zsh
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
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} set ft=markdown | call s:setupWrapping(72)
au BufRead,BufNewFile *.json set ft=javascript
au BufRead,BufNewFile *.scss set filetype=scss
au BufRead,BufNewFile *.vimrc.vpe set ft=vim

filetype on
filetype indent on
filetype plugin on

"Wrapping
function! s:setupWrapping(width)
  set wrap
  set linebreak
  echom 'set textwidth=' . a:width
  execute 'set textwidth=' . a:width
  set nolist
endfunction

function! s:teardownWrapping()
  set nowrap
  set nolinebreak
  set textwidth=0
  set list
endfunction

" Remember last location in a file, unless it's a git commit message
au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
  \| exe "normal! g`\"" | endif

autocmd VimResized * wincmd =

" Mappings {{{1
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

map <leader>n :NERDTreeToggle<cr>

" Abbreviations {{{1
" I can't spell or type
abbreviate requore require
abbreviate recieve receive
abbreviate colleciton collection
abbreviate chloropleth choropleth
abbreviate solcitor solicitor
abbreviate pry require 'pry'; binding.pry
abbreviate pdb import pdb; pdb.set_trace()
abbreviate dbg require 'debugger'; debugger
abbreviate emn Eamonn Holmes
" Search {{{1
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
" Colour Scheme {{{1
set t_Co=256
"set background=dark
if has('nvim')
  colorscheme inkpot
else
  colorscheme solarized
end

let g:airline_theme='kalisi'
" Smeargle {{{1
let g:smeargle_colour_timeout = 1
let g:smeargle_colouring_scheme = ''
let g:smeargle_newline_term_colour = 22
let g:smeargle_newline_gui_colour = '#110011'
" CtrlP {{{1
let g:ctrlp_match_window_reversed = 0         " List files from top to bottom in CtrlP
let g:ctrlp_max_height = 30                   " Set the maximum height of the match window:
let g:ctrlp_working_path_mode = 0             " CtrlP shouldn't manage the current directory
nnoremap <leader>s :CtrlP<cr>

" PyMatcher for CtrlP
if !has('python')
  echo 'In order to use pymatcher plugin, you need +python compiled vim'
else
  let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
endif

" Do not clear filenames cache, to improve CtrlP startup
" You can manualy clear it by <F5>
let g:ctrlp_clear_cache_on_exit = 0

" Set no file limit, we are building a big project
let g:ctrlp_max_files = 0

" If ag is available use it as filename list generator instead of 'find'
if executable("ag")
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --hidden -g ""'
endif

" Strip Trailing Whitespace {{{1
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
" Number Toggle {{{1
function! NumberToggle()
  if(&relativenumber == 1)
    set number
    set norelativenumber
  else
    set relativenumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>
" Copy & Paste {{{1
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
" Goyo {{{1
function! s:goyo_enter()
  set nowshowmode
  set nowshowcmd
  set scrolloff=999
  call s:setupWrapping(72)
  Limelight
endfunction

function s:goyo_leave()
  set showmode
  set showcmd
  set scrolloff=5
  call s:teardownWrapping()
  Limelight!
endfunction

map <leader>g :Goyo<cr>

autocmd! User GoyoEnter
autocmd! User GoyoLeave
autocmd  User GoyoEnter nested call <SID>goyo_enter()
autocmd  User GoyoLeave nested call <SID>goyo_leave()

" Neovim {{{1

if has('nvim')
  tnoremap jk <c-\><c-n>
  nmap <BS> <C-W>h
endif


" Cron {{{1
if $VIM_CRONTAB == "true"
    set nobackup
    set nowritebackup
endif




