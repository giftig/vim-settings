" Get the list of files changed in the past `numCommits` and load them all
" into buffers ready for editing
function! s:LoadChangedFiles(...)
  if a:0 ==# 1
    let numCommits = a:1
  else
    let numCommits = 1
  endif
  let changedFilesRaw = system("git diff HEAD~" . numCommits . " --name-only")
  let changedFiles = split(changedFilesRaw, "\n")

  for f in changedFiles
    exec "badd " . f
  endfor
endfunction

command -nargs=? LoadChangedFiles call s:LoadChangedFiles(<args>)
