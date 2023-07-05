" CUSTOM KEY BINDINGS
let mapleader = ","

" PLUGIN MAPPINGS
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>D :NERDTreeFind<CR>
nnoremap <leader>? :EnDocBrowse<CR>
nnoremap <leader>! :EnSymbol<CR>
nnoremap <leader>. :EnDeclaration<CR>

" Remap macro binding so it doesn't conflict with comment-toggle
nnoremap <c-q> q
nnoremap <T-q> dd

" USEFUL SHORTCUT MAPPINGS

" ,ye = copy current filename to + register
nnoremap <leader>ye :let @+=expand("%:p")<CR>
" ,s = save session and start a session-open command
nnoremap <leader>s  :wa<Bar>exe "mksession! " . v:this_session<CR>:so ~/sessions/
" ,<space> = remove all trailing whitespace in file
nnoremap <leader><space> :%s/\v\s+$//<CR>
" ,g = load changed files since last git commit
nnoremap <leader>g :LoadChangedFiles 1<CR>

" ,<left> and ,<right> = left and right in jump list
nnoremap <leader><left> <c-o>
nnoremap <leader><right> <c-I>
" ,<up> and ,<down> = previous and next buffers in buffers list
nnoremap <leader><up> :bn<CR>
nnoremap <leader><down> :bp<CR>
" ,n and ,N = next and previous quickfix list
nnoremap <leader>n :cn<CR>
nnoremap <leader>N :cp<CR>
" ,h and ,H: create and clear highlights (highlight.vim)
nmap <leader>h <C-h><C-w>
vmap <leader>h <C-h><C-h>
nmap <leader>H <C-h><C-n>
",c cycles through my favourite colour schemes
nnoremap <leader>c :CycleColorScheme<CR>

nnoremap <leader>j :call GotoJump()<CR>


" ,e = autoreplace emoji on the current line
nnoremap <leader>er :ReplaceEmojisOnLine<CR>
nnoremap <leader>el <c-t>:PrintEmojis<CR>

nnoremap <leader>B :Bash<space>

" FZF bindings
nnoremap <leader>f :FZF<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>s :Lines<CR>
nnoremap <leader>m :Marks<CR>

" ,q = quick find current word (python and scala only)
" ,u = quick find usages
autocmd Filetype scala nnoremap <leader>q :Qouc<CR>
autocmd Filetype python nnoremap <leader>q :Qouc<CR>
autocmd Filetype scala nnoremap <leader>u :Qfuuc<CR>
autocmd Filetype python nnoremap <leader>u :Qfuuc<CR>
autocmd Filetype scala nnoremap <leader>i :Qfiuc<CR>

" CUSTOM COMMANDS
command! FmtJson %!python -mjson.tool
command! FmtSql %!sql-formatter-cli -i /dev/stdin -o /dev/stdout
command! FmtXml %!~/scripts/format/xml

autocmd FileType json nnoremap <F7> :FmtJson<CR>
autocmd FileType sql nnoremap <F7> :FmtSql<CR>
autocmd FileType xml nnoremap <F7> :FmtXml<CR>

" Shortcut to fix syntax sync issues which sometimes occur with very large
" heredocs and the like
nnoremap <F12> :syntax sync fromstart<CR>

" Create a groupId / artifactId / version block for POMs using F8
autocmd FileType xml nnoremap <F8> <ESC>o<groupId></groupId><CR><artifactId></artifactId><CR><version></version><ESC><UP><UP>Bew<RIGHT>
