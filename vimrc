let mapleader=","                 " Make , the leader key

set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" " required!
Bundle 'gmarik/vundle'

Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'ervandew/supertab'
Bundle 'kien/ctrlp.vim'

"Colour schemes
Bundle 'altercation/vim-colors-solarized'
Bundle 'sjl/badwolf'

Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-rvm'
Bundle 'tpope/vim-cucumber'

Bundle 'vim-ruby/vim-ruby'
Bundle 'vim-scripts/fish-syntax'
Bundle 'chreekat/vim-paren-crosshairs'
Bundle 'koron/nyancat-vim'

"Auto vimscript reload for development
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-reload'

Bundle 'trapd00r/vimpoint'

"Don't want to overwrite this, might use pathogen instead
set rtp+=~/.vim/bundle/git-off-my-lawn
"Bundle 'FriedSock/git-off-my-lawn'

augroup VimReload
autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SENSIBLE DEFAULTS, MOSTLY COMING FROM JANUS
" https://github.com/carlhuda/janus/blob/master/janus/vim/core/before/plugin/settings.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set number                        " Show line numbers
set ruler                         " Display line and column number

syntax enable                     " Enable syntax highlighting
set encoding=utf-8                " Use UTF-8 by default
set backspace=indent,eol,start    " Backspace through everything

set nowrap                        " Don't wrap long lines
set tabstop=2                     " A tab is two spaces long
set shiftwidth=2                  " Auto-indent using 2 spaces
set expandtab                     " Use spaces instead of tabs
set smarttab                      " Backspace deletes whole tabs at the beginning of a line
set sts=2                         " Backspace deletes whole tabs at the end of a line
set list                          " Show invisible characters

set listchars=""                  " Reset listchars
set listchars=tab:\ \             " Display a tab as "  "
set listchars+=trail:🔲            " Display trailing whitespace as 🔲

set listchars+=extends:>          " Show ">" at the end of a wrapping line
set listchars+=precedes:<         " Show "<" at the beginning of a wrapping line

set hlsearch                      " Highlight search matches
set incsearch                     " Enable incremental searching
set ignorecase                    " Make searches case insensitive
set smartcase                     " (Unless they contain a capital letter)

set wildmenu                      " Sensible, powerful tab completion
set wildmode=list:longest,full    "

""""""""""""""""""""""
" FILE TYPES TO IGNORE
""""""""""""""""""""""

set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/plugins/*,*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*,*/tmp/*
set wildignore+=*/.git/*,*/.rbx/*,*/.hg/*,*/.svn/*,*/.DS_Store
set wildignore+=*.swp,*~,._*

""""""""""""""""""""""""""""""""""""
" WHERE TO PUT BACKUP AND SWAP FILES
""""""""""""""""""""""""""""""""""""

set backupdir=~/.vim_backup,/tmp
set directory=~/.vim_temp,/tmp

"""""""""""""""""""""""""""""""""""""""
" SET FILE TYPES FOR VARIOUS EXTENSIONS
"""""""""""""""""""""""""""""""""""""""

filetype on                       " Enable filetype detection
filetype indent on                " Enable filetype-specific indenting
filetype plugin on                " Enable filetype-specific plugins

function! s:setupWrapping()
  set wrap
  set linebreak
  set textwidth=72
  set nolist
endfunction

au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,Procfile,*.ru,*.rake,*.rabl} set ft=ruby
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} set ft=markdown | call s:setupWrapping()
au BufRead,BufNewFile *.json set ft=javascript
au BufRead,BufNewFile *.scss set filetype=scss
au BufRead,BufNewFile *.vimrc.vpe set ft=vim

" Remember last location in a file, unless it's a git commit message
au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
  \| exe "normal! g`\"" | endif

""""""""""
" MAPPINGS
""""""""""

command! W :w
command! Wq :wq
command! Q :q

" Hit return to clear search highlighting
noremap <cr> :nohlsearch<cr>

" Move around splits with Ctrl + HJKL
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-h> <c-w>h
noremap <c-l> <c-w>l

" Ctrl + L outputs a hashrocket in insert mode
imap <c-l> <space>=><space>

" Swap : and ; to make colon commands easier to type
nnoremap  ;  :

" Open vimrc more easily
map <leader>v :edit $MYVIMRC<cr>

" I will finally learn HJKL!
inoremap <Up> <nop>
nnoremap <Up> <nop>
inoremap <Down> <nop>
nnoremap <Down> <nop>
inoremap <Right> <nop>
nnoremap <Right> <nop>
inoremap <Left> <nop>
nnoremap <Left> <nop>

nnoremap L $
nnoremap H ^

inoremap jk <esc>
inoremap <esc> <nop>

" This rewires n and N to do the highlighing...
nnoremap <silent> n   n:call HLNext(0.4)<cr>
nnoremap <silent> N   N:call HLNext(0.4)<cr>

" OR ELSE just highlight the match in blue...
function! HLNext (blinktime)
  let [bufnum, lnum, col, off] = getpos('.')
  let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
  let target_pat = '\c\%#'.@/
  let ring = matchadd('StatusLine', target_pat, 101)
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
  call matchdelete(ring)
  redraw
endfunction

"""""""""
" COLOURS
"""""""""

set t_Co=256                              " Use all 256 colours
color badwolf                             " Use the badwolf colour theme
highlight LineNr ctermbg=236 ctermfg=249  " Give linenumbers a different background

""""""""""""""""""""
" MISC CONFIGURATION
""""""""""""""""""""

set shell=/bin/bash     " Make Vim load bash environment (e.g. RVM)
set timeoutlen=300      " Only wait 500ms before processing certain commands
set showcmd             " Display incomplete commands
set scrolloff=3         " Keep more lines when scrolling off the end of a buffer
set laststatus=2        " Show the statusline

" Set statusline to something sensible
" filename [encoding,line-endings][filetype] ... col,row/total-rows Position
set statusline=%f\ [%{strlen(&fenc)?&fenc:'none'},%{&ff}]%y%h%m%r%=%c,%l/%L\ %P

"""""""""""""""""""""""
" CTRLP CUSTOM SETTINGS
"""""""""""""""""""""""

map <leader>f :CtrlP<cr>

" List files from top to bottom in CtrlP
let g:ctrlp_match_window_reversed = 0

" Set the maximum height of the match window:
let g:ctrlp_max_height = 30

" CtrlP shouldn't manage the current directory
let g:ctrlp_working_path_mode = 0

"""""""""""""""""""
" NERDTREE MAPPINGS
"""""""""""""""""""

" <leader>N to open and close NERDTree
map <leader>N :NERDTreeToggle<cr>

""""""""""""""""""""""""""""""""""""""""
" STRIP TRAILING WHITESPACE ON FILE SAVE
""""""""""""""""""""""""""""""""""""""""

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


"""""""""""""""""""""""""""""""""""""""""""""""""""
" TOGGLE BETWEEN RELATIVE AND ABSOLUTE LINE NUMBERS
"""""""""""""""""""""""""""""""""""""""""""""""""""

function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

"Todo - make it tell me if there was a problem
map <leader>p :! pdflatex %<cr><cr>

"Comment many lines at once"
nnoremap H :set operatorfunc=HashOperator<cr>g@
vnoremap H :<c-u>call HashOperator(visualmode())<cr>

function! HashOperator(type)
  call CommentOperator(a:type, '#')
endfunction

function! CommentOperator(type, cmt)
  if a:type ==# 'v'
    if Commented(a:type, a:cmt)
      "NOTE: This will only work if all comments are in the same column
      execute "normal! `<k$/" . a:cmt .  "\<cr>\<c-v>`>k$/" . a:cmt . "\<cr>d"
      noh
    else
      let exp = &indentexpr
      setlocal indentexpr=""
      execute "normal! `<0\<c-v>`>0I" . a:cmt
      execute "setlocal indentexpr=" . exp
    end
  elseif a:type ==# 'char'
  elseif a:type ==# 'line'
    execute "normal! `[0\<c-v>`]0I"
  endif
endfunction

function! Commented(type, cmt)
  if a:type ==# 'v'
    let b:hash = []
    let start = line("'<")
    let end = line("'>")
    execute 'silent ' . start . ',' . end . " g/^\\s*" . a:cmt "/let b:hash = b:hash + [line('.')]"
    noh
    return range(start, end) == b:hash
  endif
endfunction
