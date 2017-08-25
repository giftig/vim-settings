" Set default window size suitable for language used, if using gvim
if &diff
  " Very wide for diff; we're diffing side-by-side
  set lines=60 columns=240
elseif has("gui_running")
  set lines=60 columns=85
  autocmd VimEnter *.py set lines=60 columns=85
  autocmd VimEnter *.scala set lines=60 columns=105
  autocmd VimEnter *.go set lines=60 columns=105
  autocmd VimEnter *.thrift set lines=60 columns=105
  autocmd VimEnter *.java set lines=60 columns=105
  autocmd VimEnter *.js set lines=60 columns=105
  autocmd VimEnter *.xml set lines=60 columns=105
  autocmd VimEnter Jenkinsfile set filetype=groovy
endif

