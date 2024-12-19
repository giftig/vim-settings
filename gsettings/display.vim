" Display options and gvim preferences

map <c-t> <ESC>:tabnew<CR>
set mouse=a
set nohlsearch

silent! colorscheme lucius
silent! LuciusDark

set t_Co=256 " Colours in terminal vim in linux

" Mark trailing whitespace in black
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=black guibg=black
autocmd BufWinEnter,BufWrite * match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * set number

" Tab completion menu
set wildchar=<tab> wildmenu wildmode=full

" More natural split positioning
set splitright
set splitbelow

autocmd GUIEnter * set lines=60 columns=120

if !&diff
  autocmd GUIEnter *.py set lines=60 columns=85
  autocmd GUIEnter *.scala set lines=60 columns=105
  autocmd GUIEnter *.go set lines=60 columns=105
  autocmd GUIEnter *.thrift set lines=60 columns=105
  autocmd GUIEnter *.java set lines=60 columns=105
  autocmd GUIEnter *.js set lines=60 columns=105
  autocmd GUIEnter *.xml set lines=60 columns=105
else
  " Superwide for diff mode
  autocmd GUIEnter * set lines=60 columns=210
endif

" No bells
autocmd VimEnter * set vb t_vb=

" Default font size seems to have changed in gvim 9.1 so make sure it's set
" to a less enormous size by default
if has("gui_running")
  set guifont=Monospace
endif
