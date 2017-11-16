function! s:BashWithEnv(cmd)
  return system("/bin/bash -c \". ~/.bashrc && " . a:cmd . "\"")
endfunction

command! -nargs=1 Bash echo s:BashWithEnv("<args>")
