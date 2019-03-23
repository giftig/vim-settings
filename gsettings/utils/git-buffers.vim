" Get the list of files changed in the past `numCommits` and load them all
" into buffers ready for editing
function! s:LoadChangedFiles(...)
  if a:0 ==# 1
    let numCommits = a:1
  else
    let numCommits = 1
  endif

  let gitRoot = substitute(system("git rev-parse --show-toplevel"), '\n$', '', '')
  let changedFilesRaw = system("git diff HEAD~" . numCommits . " --name-only --diff-filter d")
  let changedFiles = split(changedFilesRaw, "\n")

  for f in changedFiles
    let f = gitRoot . "/" . f
    exec "badd " . f
  endfor

  exec "cd ."
endfunction

command -nargs=? LoadChangedFiles call s:LoadChangedFiles(<args>)
