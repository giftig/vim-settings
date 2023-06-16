function! s:ToggleEmbiggen()
  let fontsize = 15

  if &guifont ==# ""
    let &guifont='Monospace ' . fontsize
  else
    set guifont=
  endif
endfunction

command! Big call s:ToggleEmbiggen()
command! Embiggen call s:ToggleEmbiggen()
