" Settings for notes plugin
command! -nargs=+ Sn SearchNotes <args>

let g:notes_directories = [
  \'~/Documents/vim-notes/private',
  \'~/Documents/vim-notes/public',
  \'~/.vim/bundle/vim-notes/misc/notes/user'
\]
let g:notes_word_boundaries = 1
let g:notes_tab_indents = 0
