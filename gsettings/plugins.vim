" Pathogen will pick up things I've already cloned locally
" TODO: Try to move everything into vundle if possible or I'll end up having
"       to bundle all those plugins or have a script to go fetch them, which is
"       essentially what vundle exists to avoid
call pathogen#infect()
call pathogen#helptags()

" Install extra plugins with vundle
call vundle#begin()
  Plugin 'kien/ctrlp.vim'
  Plugin 'ensime/ensime-vim'
  Plugin 'junegunn/vim-emoji'
  Plugin 'vim-scripts/tabmerge'
  Plugin 'xolox/vim-misc'
  Plugin 'xolox/vim-notes'
call vundle#end()
