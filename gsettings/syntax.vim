" By default we'll expand tabs into spaces and use 2 per tab
set expandtab
set shiftwidth=2 softtabstop=2 tabstop=2

" Some extra filetypes not understood by default
autocmd BufRead,BufNewFile build.sbt set filetype=scala
autocmd BufRead,BufNewFile *.sc set filetype=scala
autocmd BufRead,BufNewFile Jenkinsfile set filetype=groovy

" Soft tabs = 4 spaces for python, 2 for others
autocmd FileType python setlocal shiftwidth=4 softtabstop=4 cc=80
autocmd FileType scala setlocal cc=100
autocmd FileType java setlocal cc=100

autocmd BufRead,BufNewFile *.thrift set filetype=thrift
autocmd Syntax thrift runtime syntax/thrift.vim

" Configuration for go-vim
let g:go_fmt_autosave = 1
let g:go_version_warning = 0
autocmd FileType go noremap <buffer> <F7> :GoFmt<CR>
autocmd FileType go setlocal tabstop=2
autocmd FileType go setlocal cc=100
