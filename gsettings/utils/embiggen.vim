function! s:ToggleEmbiggen()
  let small='Monospace'
  let big='Monospace 15'

  if &guifont ==# small
    let &guifont=big
  else
    let &guifont=small
  endif
endfunction

command! Big call s:ToggleEmbiggen()
command! Embiggen call s:ToggleEmbiggen()
