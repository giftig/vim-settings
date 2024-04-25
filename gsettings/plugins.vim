" Pathogen will pick up things I've already cloned locally
" TODO: Try to move everything into vundle if possible or I'll end up having
"       to bundle all those plugins or have a script to go fetch them, which is
"       essentially what vundle exists to avoid
call pathogen#infect()
call pathogen#helptags()

" Install extra plugins with vundle
call vundle#begin()
  Plugin 'GEverding/vim-hocon'
  Plugin 'airblade/vim-gitgutter'
  Plugin 'derekwyatt/vim-scala'
  Plugin 'fatih/vim-go'
  Plugin 'junegunn/vim-emoji'
  Plugin 'kien/ctrlp.vim'
  Plugin 'nvie/vim-flake8'
  Plugin 'rodjek/vim-puppet'
  Plugin 'scrooloose/nerdtree'
  Plugin 'tpope/vim-cucumber'
  Plugin 'chrisbra/csv.vim'
  Plugin 'junegunn/fzf.vim'
  Plugin 'hashivim/vim-terraform'
  Plugin 'rust-lang/rust.vim'

  Plugin 'xolox/vim-misc'
  Plugin 'xolox/vim-notes'

  Plugin 'vim-scripts/AnsiEsc.vim'
  Plugin 'vim-scripts/highlight.vim'
  Plugin 'vim-scripts/tabmerge'
  Plugin 'vim-scripts/toggle_comment'
  Plugin 'vim-python/python-syntax'

  Plugin 'vim-scripts/oceandeep'

  Plugin 'diepm/vim-rest-console'

  Plugin 'giftig/vim-log-syntax'
  Plugin 'giftig/vim-lucius'
  Plugin 'giftig/python.vim'
call vundle#end()
