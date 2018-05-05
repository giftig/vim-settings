" Pathogen will pick up things I've already cloned locally
" TODO: Try to move everything into vundle if possible or I'll end up having
"       to bundle all those plugins or have a script to go fetch them, which is
"       essentially what vundle exists to avoid
call pathogen#infect()
call pathogen#helptags()

" Install extra plugins with vundle
call vundle#begin()
  Plugin 'kien/ctrlp.vim'
  Plugin 'fatih/vim-go'
  Plugin 'derekwyatt/vim-scala'
  Plugin 'nvie/vim-flake8'
  Plugin 'junegunn/vim-emoji'
  Plugin 'vim-scripts/AnsiEsc.vim'
  Plugin 'vim-scripts/tabmerge'
  Plugin 'airblade/vim-gitgutter'
  Plugin 'xolox/vim-misc'
  Plugin 'xolox/vim-notes'
  Plugin 'rodjek/vim-puppet'

  Plugin 'giftig/vim-lucius'
call vundle#end()
