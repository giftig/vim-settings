" Display options and gvim preferences

map <c-t> <ESC>:tabnew<CR>
set mouse=a
set nohlsearch

colorscheme Lucius
LuciusDark

set t_Co=256 " Colours in terminal vim in linux

" Mark trailing whitespace in black
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=black guibg=black
autocmd BufWinEnter,BufWrite * match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * set number
