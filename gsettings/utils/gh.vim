" View the current line in github
function! s:GhViewLine()
  let p = expand("%:p")
  let git_root = substitute(system("git rev-parse --show-toplevel"), '\n$', '', '')
  let short_path = p[len(git_root) + 1:]

  silent execute "!BROWSER=firefox gh browse " . short_path . ":" . line(".")
endfunction

command! GhViewLine call s:GhViewLine()
