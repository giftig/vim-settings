" Display options and gvim preferences

map <c-t> <ESC>:tabnew<CR>
set mouse=a
set nohlsearch

colorscheme lucius
LuciusDark

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

" Large if requested, or else filetype-specific
if has("gui_running")
  set lines=60 columns=240

  " Always wide if we're in diff-mode
  if !&diff
    autocmd VimEnter *.py set lines=60 columns=85
    autocmd VimEnter *.scala set lines=60 columns=105
    autocmd VimEnter *.go set lines=60 columns=105
    autocmd VimEnter *.thrift set lines=60 columns=105
    autocmd VimEnter *.java set lines=60 columns=105
    autocmd VimEnter *.js set lines=60 columns=105
    autocmd VimEnter *.xml set lines=60 columns=105
  endif
endif
