" CUSTOM KEY BINDINGS
let mapleader = ","

" PLUGIN MAPPINGS
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>? :EnDocBrowse<CR>
nnoremap <leader>! :EnSymbol<CR>

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

" ,<left> and ,<right> = left and right through tabs
nnoremap <leader><left> :tabp<CR>
nnoremap <leader><right> :tabn<CR>
" ,<up> and ,<down> = previous and next buffers in buffers list
nnoremap <leader><up> :bn<CR>
nnoremap <leader><down> :bp<CR>

" CUSTOM COMMANDS
command FmtJson %!python -mjson.tool
command FmtXml %!~/scripts/format_xml.py

autocmd FileType json nnoremap <F7> :FmtJson<CR>
autocmd FileType xml nnoremap <F7> :FmtXml<CR>

" Create a groupId / artifactId / version block for POMs using F8
autocmd FileType xml noremap <F8> <ESC>o<groupId></groupId><CR><artifactId></artifactId><CR><version></version><ESC><UP><UP>Bew<RIGHT>
