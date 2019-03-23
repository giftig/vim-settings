function! s:ToggleEmbiggen()
  if &guifont ==# ""
    set guifont=Monospace\ 20
  else
    set guifont=
  endif
endfunction

command! Big call s:ToggleEmbiggen()
command! Embiggen call s:ToggleEmbiggen()
