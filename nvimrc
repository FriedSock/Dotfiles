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
"
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

let g:loaded_rrhelper = 1
let g:did_install_default_menus = 1  " avoid stupid menu.vim (saves ~100ms)

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'ervandew/supertab'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'ltlollo/diokai'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rvm'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-fugitive'
Plug 'alexgenco/neovim-ruby'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/fish-syntax'
Plug 'chreekat/vim-paren-crosshairs'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-reload'
Plug 'vim-scripts/VimClojure'
Plug 'trapd00r/vimpoint'
Plug 'uguu-org/vim-matrix-screensaver'
Plug 'leafo/moonscript-vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vader.vim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'ekalinin/Dockerfile.vim'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'feline-nvim/feline.nvim', { 'branch': '0.5-compat' }
Plug 'jszakmeister/vim-togglecursor'
Plug 'guns/vim-clojure-static'
Plug 'kchmck/vim-coffee-script'
Plug 'ciaranm/inkpot'
Plug 'baines/vim-colorscheme-thaumaturge'
Plug 'lu-ren/SerialExperimentsLain'
Plug 'juanpabloaj/vim-pixelmuerto'
Plug 'aereal/vim-colors-japanesque'
Plug 'hewo/vim-colorscheme-deepsea'
Plug 'mhartington/oceanic-next'
"Plug 'reedes/vim-colors-pencil'
"Plug 'FriedSock/stonewashed-themes'
"Plug 'prognostic/plasticine'

call plug#end()


" Folding {{{1
set foldmethod=marker
set foldlevelstart=20
autocmd FileType vim setlocal foldmethod=marker
autocmd FileType vim setlocal foldlevel=0
nnoremap <Space> za
vnoremap <Space> za


" Random settings {{{1
set nocompatible
filetype off
syntax enable
set regexpengine=1
set hidden
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
"set fillchars+=vert:🌂
set hlsearch
set incsearch
set ignorecase
set smartcase
set wildmenu
set wildmode=list:longest,full
set backupdir=~/.vim_backup,/tmp
set directory=~/.vim_temp,/tmp


set shell=/bin/bash\ --login
set mouse=
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

set clipboard+=unnamedplus

set lazyredraw
set ttyfast

"Wrapping
function! s:setupWrapping(width)
  setlocal wrap
  setlocal linebreak
  "echom 'setlocal textwidth=' . a:width
  execute 'setlocal textwidth=' . a:width
  setlocal nolist
endfunction

function! s:teardownWrapping()
  setlocal nowrap
  setlocal nolinebreak
  setlocal textwidth=0
  setlocal list
endfunction

" Remember last location in a file, unless it's a git commit message
au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
  \| exe "normal! g`\"" | endif

autocmd VimResized * wincmd =

au FileType gitcommit call s:setupWrapping(72)
au FileType gitcommit setlocal colorcolumn=50
"au FileType gitcommit execute 'Goyo'


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
"
abbreviate requore require
abbreviate ingore ignore
abbreviate recieve receive
abbreviate colleciton collection
abbreviate chloropleth choropleth
abbreviate solcitor solicitor
abbreviate pry require 'pry'; binding.pry; hello=1
abbreviate pdb import pdb; pdb.set_trace()
abbreviate dbg require 'debugger'; debugger
abbreviate emn "Eamonn Holmes'

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

" Smeargle {{{1
let g:smeargle_colour_timeout = 1
let g:smeargle_colouring_scheme = ''
let g:smeargle_newline_term_colour = 22
let g:smeargle_newline_gui_colour = '#110011'
" CtrlP {{{1
let g:ctrlp_match_window_reversed = 0         " List files from top to bottom in CtrlP
nnoremap <leader>s :FZF<cr>
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
  set noshowmode
  set noshowcmd
  set scrolloff=999
  call s:setupWrapping(72)
  Limelight
endfunction

function! s:goyo_leave()
  set showmode
  set showcmd
  set scrolloff=5
  call s:teardownWrapping()
  Limelight!
endfunction

let g:limelight_conceal_ctermfg = 'darkgray'

map <leader>g :Goyo<cr>

autocmd! User GoyoEnter
autocmd! User GoyoLeave
autocmd!  User GoyoEnter nested call <SID>goyo_enter()
autocmd!  User GoyoLeave nested call <SID>goyo_leave()

" Neovim {{{1

if has('nvim')
  tnoremap jk <c-\><c-n>
  nmap <BS> <C-W>h

  let g:terminal_scrollback_buffer_size = 100000
endif

if (has("termguicolors"))
  set termguicolors
endif

" Airline {{{1
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
" Always show statusline
"set laststatus=2
" Powerline setup
"set laststatus=2
"set term=xterm-256color
"set termencoding=utf-8
"set guifont=Ubuntu\ Mono\ derivative\ Powerline:10
" set guifont=Ubuntu\ Mono
"let g:Powerline_symbols = 'fancy'

" Neomake {{{1
" Run NeoMake on read and write operations
"autocmd! BufReadPost,BufWritePost * Neomake

" Disable inherited syntastic
"let g:syntastic_mode_map = {
"  \ mode": passive",
"  \ active_filetypes": [],
"  \ passive_filetypes": [] }

"let g:neomake_serialize = 1
"let g:neomake_serialize_abort_on_error = 1
"
" Syntastic {{{1
let g:syntastic_shell = '/bin/sh'

" Colour Scheme {{{1
set t_Co=256
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme diokai
"set background=dark
"colorscheme stonewashed-256
"colorscheme plasticine
"hi CursorLine ctermfg=00 ctermbg=00 cterm=bold
"
" Paste UUID {{{1
 function! ExecuteAndPaste(command)
  " Save the current position
  let save_cursor = getpos(".")

  " Execute the shell command and capture the output
  let output = system(a:command)

  " Paste the output at the current cursor position
  call setline('.', split(output, '\n'))

  " Restore the cursor position
  call setpos('.', save_cursor)
endfunction

nnoremap <leader>u :call ExecuteAndPaste("ruby -e \"require 'securerandom'; puts SecureRandom.uuid\"")<CR>
