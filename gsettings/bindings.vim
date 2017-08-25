" CUSTOM KEY BINDINGS
let mapleader = ","

nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>? :EnDocBrowse<CR>
nnoremap <leader>! :EnSymbol<CR>
nnoremap <leader>ye :let @+=expand("%:p")<CR>
nnoremap <leader>s  :wa<Bar>exe "mksession! " . v:this_session<CR>:so ~/sessions/
nnoremap <leader><space> :%s/\v\s+$//<CR>

" Remap macro binding so it doesn't conflict with comment-toggle
nnoremap <c-q> q
nnoremap <T-q> dd

" CUSTOM COMMANDS
command FmtJson %!python -mjson.tool
command FmtXml %!~/scripts/format_xml.py

autocmd FileType json nnoremap <F7> :FmtJson<CR>
autocmd FileType xml nnoremap <F7> :FmtXml<CR>

" Create a groupId / artifactId / version block for POMs using F8
autocmd FileType xml noremap <F8> <ESC>o<groupId></groupId><CR><artifactId></artifactId><CR><version></version><ESC><UP><UP>Bew<RIGHT>
