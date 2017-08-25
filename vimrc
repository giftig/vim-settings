" Pathogen load
" filetype off

call pathogen#infect()
call pathogen#helptags()

" Install extra plugins with vundle
call vundle#begin()
  Plugin 'ensime/ensime-vim'
  Plugin 'vim-scripts/tabmerge'
  Plugin 'xolox/vim-misc'
  Plugin 'xolox/vim-notes'
call vundle#end()

" Ensime hack
let ensime_server_v2=1

let mapleader = ","

" CUSTOM KEY BINDINGS
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>? :EnDocBrowse<CR>
nnoremap <leader>! :EnSymbol<CR>
nnoremap <leader>ye :let @+=expand("%:p")<CR>
nnoremap <leader>s  :wa<Bar>exe "mksession! " . v:this_session<CR>:so ~/sessions/
nnoremap <leader><space> :%s/\v\s+$//<CR>

" CUSTOM COMMANDS
command FmtXml %!~/scripts/format_xml.py
command FmtJson %!python -mjson.tool

" Remap macro button so it doesn't conflict with comment-toggle
nnoremap <c-q> q

nnoremap <T-q> dd

" Set default window size suitable for language used, if using gvim
if &diff
  " Very wide for diff; we're diffing side-by-side
  set lines=60 columns=240
elseif has("gui_running")
  set lines=60 columns=85
  autocmd VimEnter *.py set lines=60 columns=85
  autocmd VimEnter *.scala set lines=60 columns=105
  autocmd VimEnter *.go set lines=60 columns=105
  autocmd VimEnter *.thrift set lines=60 columns=105
  autocmd VimEnter *.java set lines=60 columns=105
  autocmd VimEnter *.js set lines=60 columns=105
  autocmd VimEnter *.xml set lines=60 columns=105
  autocmd VimEnter Jenkinsfile set filetype=groovy
endif

" Mark trailing whitespace in black
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=black guibg=black
autocmd BufWinEnter,BufWrite * match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * set number

" Mainly for gvim
map <c-t> <ESC>:tabnew<CR>
set mouse=a

" build.sbt should have scala highlighting
autocmd BufRead,BufNewFile build.sbt set filetype=scala
" and ammonite scripts
autocmd BufRead,BufNewFile *.sc set filetype=scala

" Don't use highlight search
set nohlsearch

colorscheme lucius
LuciusDark

" Autoload NerdTree
"au VimEnter * NERDTree
"au BufEnter * NERDTreeMirror
let NERDTreeShowLineNumbers=0

" Autocheck jshint
" au FileType javascript au BufWritePost * JSHint

filetype plugin indent on

set expandtab
set t_Co=256 " Colours in terminal vim in linux
set shiftwidth=2 softtabstop=2
"
" Soft tabs = 4 spaces for python, 2 for others
autocmd FileType python setlocal shiftwidth=4 softtabstop=4
autocmd FileType python setlocal cc=80
autocmd FileType scala setlocal tabstop=2 shiftwidth=2 softtabstop=2 cc=100
autocmd FileType java setlocal cc=100

autocmd BufRead,BufNewFile *.thrift set filetype=thrift
autocmd Syntax thrift source ~/.vim/syntax/thrift.vim

" Configuration for go-vim
let g:go_fmt_autosave = 1
autocmd FileType go noremap <buffer> <F7> :GoFmt<CR>
autocmd FileType go setlocal tabstop=2
autocmd FileType go setlocal cc=100

" Scala-specific config
autocmd FileType scala noremap <buffer> <F2> :EnDocBrowse<CR>

" Create a groupId / artifactId / version block for POMs using F7
autocmd FileType xml noremap <F7> <ESC>o<groupId></groupId><CR><artifactId></artifactId><CR><version></version><ESC><UP><UP>Bew<RIGHT>

autocmd FileType json nnoremap <F7> :%!python -mjson.tool<CR>
autocmd FileType xml nnoremap <F7> :%!~/scripts/format_xml.py<CR>

syntax on
